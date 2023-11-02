import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  // There is we make Variable.
  final String buttonText;
  // There is we make Control Function.
  // The "onPressed" is the name of the function calling.
  final void Function() ? onPressed;
  // There is we make to control the width or height of the Button.
  final double? width;
  // Now Pass this Variable into the Consturctor.
  const CustomBotton({super.key, required this.buttonText, this.onPressed, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        // Now there is we pass the function into the "onPressed".
        // This is give us to use it in the different file for different processes. 
        onPressed: onPressed,
        // After that Pass it into the text place.
        child: Text(buttonText), 
        ),
    );
  }
}