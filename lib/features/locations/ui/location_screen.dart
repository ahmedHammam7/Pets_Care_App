import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    super.key,
    required this.lat,
    required this.lng,
  });
  final double lat;
  final double lng;
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final MapController _mapController = MapController();
  LocationData? _currentLocation;
  List<LatLng> _routePoints = [];
  final List<Marker> _markers = [];
  bool _isLoading = false;
  bool _locationPermissionGranted = false;
  static const double _defaultZoom = 15.0;

  final String _orsApiKey =
      "5b3ce3597851110001cf624884c3f2aec4d64fb5a2ac1e3e28fc093e";

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    _addDestinationMarker(); // Add destination marker immediately
  }

  Future<void> _checkLocationPermission() async {
    final status = await Permission.location.request();
    setState(() {
      _locationPermissionGranted = status.isGranted;
    });

    if (_locationPermissionGranted) {
      _getCurrentLocation();
    }
  }

  Future<void> _getCurrentLocation() async {
    if (!_locationPermissionGranted) return;

    setState(() => _isLoading = true);

    try {
      final location = Location();
      final userLocation = await location.getLocation();

      setState(() {
        _currentLocation = userLocation;
        _updateUserMarker();
      });

      // Calculate route from given lat/lng once and save it
      _calculateAndSaveRoute();

      location.onLocationChanged.listen((newLocation) {
        if (mounted) {
          setState(() {
            _currentLocation = newLocation;
            _updateUserMarker();
          });
          // Don't recalculate route - keep the saved route
        }
      });
    } catch (e) {
      _showErrorSnackbar("Could not get location: ${e.toString()}");
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _updateUserMarker() {
    _markers.removeWhere((m) => m.key == const ValueKey('user_location'));

    if (_currentLocation != null) {
      _markers.add(Marker(
        key: const ValueKey('user_location'),
        width: 80.0.w,
        height: 80.0.h,
        point:
            LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
        child: Icon(
          Icons.my_location,
          color: Colors.blue,
          size: 40.sp,
        ),
      ));
    }
  }

  void _addDestinationMarker() {
    final startPoint = LatLng(widget.lat, widget.lng);
    _updateStartMarker(startPoint);
  }

  Future<void> _calculateAndSaveRoute() async {
    if (_currentLocation == null) return;

    final startPoint = LatLng(widget.lat, widget.lng);
    final destination =
        LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!);
    await _getRoute(startPoint, destination);
  }

  Future<void> _getRoute(LatLng start, LatLng destination) async {
    setState(() {
      _isLoading = true;
      _routePoints = []; // Clear previous route
    });

    try {
      final response = await http.get(
        Uri.parse('https://api.openrouteservice.org/v2/directions/driving-car?'
            'api_key=$_orsApiKey&'
            'start=${start.longitude},${start.latitude}&'
            'end=${destination.longitude},${destination.latitude}'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final coordinates =
            data['features'][0]['geometry']['coordinates'] as List;

        setState(() {
          _routePoints = coordinates.map((e) => LatLng(e[1], e[0])).toList();
        });
      } else {
        _showErrorSnackbar("Failed to get route: ${response.statusCode}");
      }
    } catch (e) {
      _showErrorSnackbar("Route calculation failed: ${e.toString()}");
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _updateStartMarker(LatLng point) {
    _markers.removeWhere((m) => m.key == const ValueKey('start_point'));

    _markers.add(Marker(
      key: const ValueKey('start_point'),
      width: 80.0.w,
      height: 80.0.h,
      point: point,
      child: Icon(
        Icons.pets,
        color: Colors.black,
        size: 30.sp,
      ),
    ));
  }

  void _showErrorSnackbar(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    });
  }

  void _centerOnUserLocation() {
    if (_currentLocation != null) {
      _mapController.move(
        LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
        _defaultZoom,
      );
    }
  }

  void _centerOnStartPoint() {
    _mapController.move(
      LatLng(widget.lat, widget.lng),
      _defaultZoom,
    );
  }

  void _fitBothLocations() {
    if (_currentLocation != null) {
      final bounds = LatLngBounds.fromPoints([
        LatLng(widget.lat, widget.lng),
        LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
      ]);
      _mapController.fitCamera(CameraFit.bounds(
          bounds: bounds, padding: const EdgeInsets.all(50.0)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            'Location Tracking',
            style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.white,
              size: 24.sp,
            ),
            onPressed: () async {
              await context.pushNamedAndRemoveUntil(
                  Routes.homeLayout, (route) => false,
                  predicate: (route) => false);
            },
          )),
      body: Stack(
        children: [
          if (!_locationPermissionGranted)
            const Center(child: Text('Location permission required')),
          if (_locationPermissionGranted && _currentLocation == null)
            const Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            )),
          if (_currentLocation != null)
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: LatLng(
                  _currentLocation!.latitude!,
                  _currentLocation!.longitude!,
                ),
                initialZoom: _defaultZoom,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.pets_care_app',
                ),
                MarkerLayer(markers: _markers),
                if (_routePoints
                    .isNotEmpty) // Only add PolylineLayer if we have points
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: _routePoints,
                        color: AppColors.primaryColor,
                        strokeWidth: 4.w,
                      ),
                    ],
                  ),
              ],
            ),
          if (_isLoading)
            const Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            )),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "start",
            backgroundColor: Colors.black,
            onPressed: _centerOnStartPoint,
            child: const Icon(Icons.pets, color: AppColors.white),
          ),
          SizedBox(height: 10.h),
          FloatingActionButton(
            heroTag: "user",
            backgroundColor: AppColors.primaryColor,
            onPressed: _centerOnUserLocation,
            child: const Icon(Icons.my_location, color: AppColors.white),
          ),
          SizedBox(height: 10.h),
          FloatingActionButton(
            heroTag: "fit",
            backgroundColor: AppColors.primaryColor,
            onPressed: _fitBothLocations,
            child: const Icon(Icons.fit_screen, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
