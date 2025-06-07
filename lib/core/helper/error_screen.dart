import 'package:flutter/material.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/routing/routes.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key, required this.errorDetails});
  final FlutterErrorDetails errorDetails;
  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _pulseController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _startAnimations();
  }

  void _startAnimations() {
    _fadeController.forward();
    _slideController.forward();
    _pulseController.repeat(reverse: true);
  }

  String get _getErrorTitle {
    final exception = widget.errorDetails.exception;
    if (exception is FlutterError) {
      return 'Flutter Error Occurred';
    } else if (exception is ArgumentError) {
      return 'Invalid Argument Error';
    } else if (exception is StateError) {
      return 'State Error';
    } else if (exception is TypeError) {
      return 'Type Error';
    } else if (exception is FormatException) {
      return 'Format Exception';
    } else if (exception is Exception) {
      return 'Application Error';
    } else {
      return 'Oops! We\'re feeling a bit overwhelmed';
    }
  }

  String get _getErrorMessage {
    final exception = widget.errorDetails.exception;
    if (exception is FlutterError) {
      // Clean up FlutterError message by removing technical details
      String message = exception.message;
      if (message.length > 200) {
        message = '${message.substring(0, 200)}...';
      }
      return 'A Flutter framework error occurred: $message';
    } else if (exception is ArgumentError) {
      return 'An invalid argument was provided: ${exception.message ?? exception.toString()}';
    } else if (exception is StateError) {
      return 'The application is in an invalid state: ${exception.message}';
    } else if (exception is TypeError) {
      return 'A type-related error occurred. This usually means there\'s a mismatch in expected data types.';
    } else if (exception is FormatException) {
      return 'Data formatting error: ${exception.message}';
    } else if (exception is Exception) {
      return 'An unexpected error occurred: ${exception.toString()}';
    } else {
      return 'Something went wrong and now we\'re feeling a bit shy about it. Don\'t worry though - we\'ll get this sorted out soon! 🤗';
    }
  }

  String get _getStackTrace {
    return widget.errorDetails.stack?.toString() ?? 'No stack trace available';
  }

  void _showErrorDetails() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1a1a2e),
        title: const Text(
          'Error Details',
          style: TextStyle(color: Colors.white),
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 400,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Exception Type:',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.errorDetails.exception.runtimeType.toString(),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                if (widget.errorDetails.context != null) ...[
                  const Text(
                    'Context:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.errorDetails.context.toString(),
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                      fontFamily: 'monospace',
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                const Text(
                  'Full Exception:',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.errorDetails.exception.toString(),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                    fontFamily: 'monospace',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Stack Trace:',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _getStackTrace,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Close',
              style: TextStyle(color: Color(0xFF4ecdc4)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1a1a2e),
              Color(0xFF16213e),
              Color(0xFF0f3460),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated Error Emoji
                      AnimatedBuilder(
                        animation: _pulseAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _pulseAnimation.value,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/png/shy.png', // Add your emoji image to assets folder
                                width: 120,
                                height: 120,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  // Fallback to original icon if image fails to load
                                  return Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFffc107),
                                          Color(0xFFff9800),
                                        ],
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.sentiment_very_dissatisfied_rounded,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 40),

                      // Error Title
                      Text(
                        _getErrorTitle,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: -0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 20),

                      // Error Message
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          _getErrorMessage,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.8),
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const SizedBox(height: 50),

                      // Action Buttons
                      Column(
                        children: [
                          // Home Button
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () async {
                                await context.pushNamedAndRemoveUntil(
                                    Routes.homeLayout, (route) => false,
                                    predicate: (route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4ecdc4),
                                foregroundColor: Colors.white,
                                elevation: 8,
                                shadowColor:
                                    const Color(0xFF4ecdc4).withOpacity(0.4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.home_rounded, size: 24),
                                  SizedBox(width: 12),
                                  Text(
                                    'Go to Home',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Show Error Details Button
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: TextButton(
                              onPressed: _showErrorDetails,
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white.withOpacity(0.7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.info_outline_rounded, size: 20),
                                  SizedBox(width: 8),
                                  Text(
                                    'Show Error Details',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // Support Text
                      Text(
                        'Need help? Contact our support team',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.6),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _pulseController.dispose();
    super.dispose();
  }
}
