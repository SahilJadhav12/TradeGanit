import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {

  CommonTextField({
    Key? key,
    required this.controller,
    this.label,
    this.imagePath,
    this.onTap,
    this.validator,
    this.isEmail,
    this.textInputType,
    this.inputFormatters,
    this.maxlength,
  }) : super(key: key);

  TextEditingController controller;
  String? label;
  String? imagePath;
  Function? onTap;
  Function? validator;
  bool? isEmail=false;
  TextInputType? textInputType;
  int? inputFormatters;
  int? maxlength;




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
        keyboardType: textInputType ?? TextInputType.text,
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
          RegExp email = RegExp(r'\S+@\S+\.\S+');
          if(!email.hasMatch(value) && isEmail==true) {
            return 'Please enter proper Email ID';
          }
          return null;
        },
      ),
    );
  }
}
