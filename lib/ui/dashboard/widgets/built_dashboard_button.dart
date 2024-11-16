// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DashboardButton extends StatefulWidget {
  final double width;
  final String? iconPath;

  final VoidCallback onTap;
  final String buttonName;
  final Color buttonColor;

  const DashboardButton({
    required this.onTap,
    required this.buttonName,
    required this.buttonColor,
    required this.width,
    this.iconPath,
    super.key,
  });

  @override
  State<DashboardButton> createState() => _DashboardButtonState();
}

class _DashboardButtonState extends State<DashboardButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTapDown: (_) {
            setState(() {
              _isPressed = true;
            });
          },
          onTapUp: (_) {
            setState(() {
              _isPressed = false;
            });
          },
          onTapCancel: () {
            setState(() {
              _isPressed = false;
            });
          },
          onTap: () {
            // Code to execute when the widget is tapped
            widget.onTap();
          },
          child: AnimatedContainer(
            width: widget.width,
            height: 141,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _isPressed
                  ? widget.buttonColor.withOpacity(0.8)
                  : widget.buttonColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: widget.iconPath != null
                ? Image.asset(
                    widget.iconPath!,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          widget.buttonName,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  bool _isPressed = false;
}
