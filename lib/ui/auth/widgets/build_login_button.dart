import 'package:flutter/material.dart';

class BuildLoginButton extends StatelessWidget {
  final String text;
  final Function()? onLongPress;
  final Function() onPressed;


  const BuildLoginButton({
    required this.text,
    required this.onPressed,
    Key? key,
    this.onLongPress,
  }) : super(key: key);

  final double borderRadius = 25;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: const LinearGradient(
                colors: [Color(0xff53E88B), Color(0xff15BE77)])),
        child: ElevatedButton(
            style: ButtonStyle(
                elevation: WidgetStateProperty.all(0),
                alignment: Alignment.center,
                padding: WidgetStateProperty.all(const EdgeInsets.only(
                    right: 75, left: 75, top: 15, bottom: 15)),
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)),
                )),
            onPressed: onPressed,
            onLongPress: onLongPress,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            )));
  }
}
