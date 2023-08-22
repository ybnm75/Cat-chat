import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Color color;
  final void Function() submit;
  final String buttonName;

     const SubmitButton({
    Key? key, required this.color, required this.buttonName, required this.submit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: submit,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}