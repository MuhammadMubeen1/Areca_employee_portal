import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final  Widget? prefixIcon;
  final  Widget? suffixIcon;

  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    required this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        
        cursorColor: Colors.grey,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.all(20),
          labelText: labelText,
          hintText: hintText,
          hintStyle: const  TextStyle(color: Color(0xff999CAD), fontWeight: FontWeight.w400, fontSize: 14),
          helperText: helperText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(18.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
    );
  }
}
