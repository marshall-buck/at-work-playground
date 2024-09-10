
// reusable_text_field.dart

import 'package:flutter/material.dart';

class ReusableTextField extends StatefulWidget {
  const ReusableTextField({super.key});

  @override
  State<ReusableTextField> createState()
 => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    TextChangeNotification(_controller.text).dispatch(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
    );
  }
}

class TextChangeNotification extends Notification {
  final String text;

  TextChangeNotification(this.text);
}


// NotificationListener<TextChangeNotification>(
//      onNotification: (notification) {
//        // Handle the updated text here
//        print("New search term: ${notification.text}");
//        return true; 
//      },
//      child: ReusableTextField(),
//    )
