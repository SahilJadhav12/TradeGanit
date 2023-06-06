import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {

  CommonTextField({
    Key? key,
    required this.controller,
    this.label,
    this.imagePath,
    this.onTap,
    this.validator,
  }) : super(key: key);

  TextEditingController controller;
  String? label;
  String? imagePath;
  Function? onTap;
  Function? validator;




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.all(8),
              child: ImageIcon(AssetImage(imagePath ?? 'images/profile.png'),),
            ),
            border: OutlineInputBorder(),
            labelText: label ?? "TextField"
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        onTap:() {
          if (onTap != null) {
            onTap!();
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter value';
          }
          return null;
        },
      ),
    );
  }
}
