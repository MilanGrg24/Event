// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final Icon? prefixIcon;
  final Color? prefixColor;
  final IconButton? suffixIcon;
  final Color? suffixIconColor;
  final String? hintText;
  final Color? hintColor;
  final Color? backgroundColor;
  final Color? textColor;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final bool isPassword;
  final bool isPhoneNumber;
  final Color? cursorColor;
  final TextEditingController? controller;
  final String? errorText;
  final FormFieldValidator<String>? validator;
  // ignore: prefer_typing_uninitialized_variables
  final customValidator;
  final bool obscureText;
  final GlobalKey<FormFieldState>? fieldKey;
  final Function(String val)? onChanged;

  const CustomTextFormField({
    super.key,
    this.prefixIcon,
    this.prefixColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.hintText,
    this.hintColor,
    this.backgroundColor,
    this.textColor,
    this.maxLines,
    this.minLines,
    this.fillColor,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.cursorColor,
    this.controller,
    this.errorText,
    this.validator,
    this.customValidator,
    this.obscureText = false,
    this.fieldKey,
    this.onChanged,
    //required Function(dynamic email) validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(fontSize: 16),
      cursorColor: Colors.deepPurpleAccent,
      maxLines: 1,
      onChanged: widget.onChanged,
      minLines: widget.minLines,
      obscuringCharacter: "*",
      obscureText: widget.isPassword ? !isPasswordVisible : false,
      keyboardType:
          widget.isPhoneNumber ? TextInputType.phone : TextInputType.text,
      inputFormatters:
          widget.isPhoneNumber
              ? [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+'))]
              : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "${widget.hintText}";
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.backgroundColor,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  splashRadius: 20,
                  iconSize: 22,
                  icon:
                      isPasswordVisible
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off_rounded),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  color: Colors.amber,
                )
                : widget.suffixIcon,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        errorStyle: const TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.amber, width: 1),
        ),
        errorText: widget.errorText,
      ),
    );
  }
}
