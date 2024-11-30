import 'package:flutter/material.dart';

class Buttom extends StatelessWidget {
  Buttom({super.key, required this.text, this.ontap});
  String text;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          height: 60,
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.blue, fontSize: 25),
            ),
          )),
    );
  }
}
