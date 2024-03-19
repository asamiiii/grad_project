// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:grad_project/constants/constants.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(this.label, this.hintText, this.onChanged, this.type,
      {Key? key})
      : super(key: key);
  String? label;
  String? hintText;
  Function(String)? onChanged;
  @required
  TextInputType type;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 244,
      width: 50,
      child: TextFormField(
        cursorColor: blueColor,
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          }
        },
        style: const TextStyle(color: blueColor),
        onChanged: onChanged,
        keyboardType: type,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: blueColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: maxGrayColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: blueColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: blueColor,
            ),
          ),
          labelText: label,
          labelStyle: const TextStyle(color: blueColor),
          hintText: hintText,
          hintStyle: const TextStyle(color: blueColor),
        ),
      ),
    );
  }
}

class BuildTextFormFeild extends StatelessWidget {
  BuildTextFormFeild({
    this.keyboardType,
    this.isPassword,
    required this.onChanged,
    this.prefixIcon,
    this.visibilityTaped,
    this.hintText,
    this.label,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);
  IconData? prefixIcon;
  IconData? suffixIcon;
  TextInputType? keyboardType;
  bool? isPassword;
  Function(String) onChanged;
  final VoidCallback? visibilityTaped;
  String? label;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      width: 100.w,
      child: TextFormField(
        maxLines: 1,
        cursorColor: blueColor,
        keyboardType: keyboardType,
        obscureText: isPassword!,
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          }
        },
        onChanged: onChanged,
        style: TextStyle(
          color: blackColor,
          fontWeight: FontWeight.w400,
          fontSize: 13.sp,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: blueColor,
          ),
          suffixIcon: GestureDetector(
            onTap: visibilityTaped,
            child: Icon(
              suffixIcon,
              color: maximumBlackColor,
              size: 20.sp,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: blueColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: blueColor,
              width: 1.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: blueColor,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: blueColor,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: blueColor,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: blueColor,
              width: 1.5,
            ),
          ),
          labelText: label,
          labelStyle: const TextStyle(
            color: blueColor,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: miniBlackColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
