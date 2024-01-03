import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/style/color/colors.dart';
import '../../utils/style/text_style/text_style.dart';

class CustomTextFields {
  static Widget textfield({
    required controller,
    String? hintText,
    double? height,
    Icon? prefixIcon,
    Icon? suffixIcon,
    Color? iconColor,
  }) {
    return SizedBox(
      height: height ?? 50,
      child: TextField(
        cursorColor: AppColors.indicatorTextColor,
        textInputAction: TextInputAction.next,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: AppTextStyle.customTextStyle(
            color: AppColors.textColor,
          ),
          fillColor: AppColors.appbarColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          suffixIcon: suffixIcon,
          suffixIconColor: iconColor ?? Colors.white,
          prefixIcon: prefixIcon,
          prefixIconColor: iconColor ?? Colors.white,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  static Widget appTextField({
    controller,
    onPressed,
    prefixIcon,
    double? height,
    Color? borderColor,
    width,
    hintText,
    validator,
    initialValue,
    obscureText = false,
    IconData? suffixIcon,
    onSuffixPressed,
    readOnly = false,
    onChanged,
    keBoardType,
  }) {
    //final bool suffixTapped;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
      ),
      child: TextFormField(
        style: GoogleFonts.poppins(
            color: AppColors.white, fontWeight: FontWeight.w400),
        cursorColor: AppColors.indicatorTextColor,
        textInputAction: TextInputAction.next,
        textAlign: TextAlign.start,
        keyboardType: keBoardType,
        readOnly: readOnly,
        onTap: onPressed,
        initialValue: initialValue,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText!,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            prefixIcon,
            size: 28.0,
            color: Colors.grey,
          ),
          suffixIcon: GestureDetector(
            onTap: onSuffixPressed,
            child: Icon(
              suffixIcon,
              color: AppColors.textColor,
              size: 25,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30.0),
          ),
          filled: true,
          // alignLabelWithHint: true,
          fillColor: AppColors.appbarColor,
          hintStyle: TextStyle(
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }

  static Widget squareTextField({
    required controller,
    required String hintText,
    void Function(String)? onChanged,
    void Function()? onTap,
    TextInputType? keyBoardType,
    BorderRadius? borderRadius,
    String? Function(String?)? validator,
    Color? borderColor,
    TextStyle? hintStyle,
    Widget? suffixIcon,
    bool? autocorrect,
    bool? fillColor,
    int? maxLines,
    Icon? prefixIcon,
    EdgeInsetsGeometry? contentPadding,
    Color? hintColor,
    FontWeight? hintWeight,
    TextInputAction? textInputAction,
    bool? readOnly,
    BorderStyle? borderStyle,
    double? borderWidth,
  }) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly ?? false,
      keyboardType: keyBoardType,
      cursorColor: AppColors.indicatorTextColor,
      maxLines: maxLines ?? 1,
      autocorrect: autocorrect ?? false,
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        prefixIcon: prefixIcon,
        fillColor: AppColors.appbarColor,
        filled: fillColor ?? false,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius ?? BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius ?? BorderRadius.circular(10.0),
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.customTextStyle(
          color: hintColor ?? AppColors.textColor,
          fontWeight: hintWeight ?? FontWeight.normal,
          size: 14,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius ?? BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
