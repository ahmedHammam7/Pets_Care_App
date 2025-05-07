import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _userMessage = TextEditingController();
  static const apiKey = "AIzaSyDgUpDnluQG82-Wii4zPpP7x01Rx2WQV_Q";
  final model = GenerativeModel(
    model: "gemini-1.5-flash",
    apiKey: apiKey,
  );
  final List<Message> _messages = [];
  Future<void> sendMessage() async {
    final message = _userMessage.text;
    _userMessage.clear();
    setState(() {
      _messages
          .add(Message(isUser: true, message: message, date: DateTime.now()));
    });
    final content = [Content.text(message)];
    final response = await model.generateContent(content);
    setState(() {
      _messages.add(Message(
          isUser: false, message: response.text ?? "", date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 24.sp,
          ),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final message = _messages[index];
              return Messages(
                isUSer: message.isUser,
                message: message.message,
                date: DateFormat("HH:mm").format(message.date),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
          child: Row(
            children: [
              Expanded(
                flex: 15,
                child: TextFormField(
                  controller: _userMessage,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide:
                          BorderSide(color: AppColors.primaryColor, width: 2.w),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide:
                          BorderSide(color: AppColors.primaryColor, width: 2.w),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide:
                          BorderSide(color: AppColors.primaryColor, width: 2.w),
                    ),
                    hintStyle: AppTextStyles.textFieldLabel,
                    hintText: "Type a message",
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () async {
                  await sendMessage();
                },
                icon: const Icon(
                  Icons.send,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class Messages extends StatelessWidget {
  const Messages(
      {super.key,
      required this.isUSer,
      required this.message,
      required this.date});
  final bool isUSer;
  final String message;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      margin: EdgeInsets.symmetric(vertical: 15.h).copyWith(
        left: isUSer ? 100 : 10,
        right: isUSer ? 10 : 100,
      ),
      decoration: BoxDecoration(
        color: isUSer ? AppColors.primaryColor : AppColors.gray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          bottomLeft: isUSer ? Radius.circular(30.r) : Radius.zero,
          topRight: Radius.circular(30.r),
          bottomRight: isUSer ? Radius.zero : Radius.circular(30.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
              color: isUSer ? AppColors.white : AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: isUSer ? AppColors.white : AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final bool isUser;
  final String message;
  final DateTime date;
  Message({required this.isUser, required this.message, required this.date});
}
