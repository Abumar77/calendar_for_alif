import 'package:flutter/material.dart';

class CustomNavigateButton extends StatelessWidget {
  const CustomNavigateButton(
      {Key? key, required this.icon, required this.callback})
      : super(key: key);

  final Icon icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(50),
        ),
        child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.center,
            onPressed: callback,
            color: Colors.black,
            icon: icon),
      ),
    );
  }
}
