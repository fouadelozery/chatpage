import 'package:flutter/material.dart';

class GeneralTextfield extends StatelessWidget {
  GeneralTextfield({
    super.key,
    required this.hintname,
    this.onChanged,
  });
  String? hintname;

  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, right: 8),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'Field is required';
          }
          return null;
        },
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintname,

          hintStyle: const TextStyle(color: Colors.white),
          //  hintStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
          )),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}
