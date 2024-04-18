import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? ctrl;
  final Widget  ?suffixIcon;
  final Widget  ?prefixIcon;
  final Widget  ?label;
  final String? hintText;

  final String? initialValue;
  final TextInputType? keyboardType;
  final Function? validator;
  final FocusNode? focusNode;
  final Function? onFieldSubmitted;
  final Function? onChanged;
  const AppTextFormField(
      {Key? key,
        this.label,
      this.ctrl,
      this.hintText,
      this.keyboardType,
      this.onFieldSubmitted,
      this.focusNode,
      this.validator,
        this.suffixIcon,
        this.prefixIcon,
        this.onChanged,
        this.initialValue
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue:initialValue,
      controller: ctrl,
      keyboardType: keyboardType,
      focusNode: focusNode,
    // onChanged: (value) => onChanged!(value),
      onFieldSubmitted: (value) => onFieldSubmitted!(value),
      validator: (input) => validator!(input),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
          prefixIcon:prefixIcon ,
          hintText: hintText,
          label: label,
          hintStyle: const TextStyle(color: Colors.grey),
          labelStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey))),
    );
  }
}
