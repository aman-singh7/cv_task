import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputAction? action;
  final InputBorder? border;
  final TextStyle? style;
  final String? hint;

  const TextInput({
    this.controller,
    this.onChanged,
    this.action,
    this.border,
    this.style,
    this.hint,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: action,
      style: style,
      decoration: InputDecoration(
        border: border ?? const OutlineInputBorder(),
        hintText: hint,
      ),
    );
  }
}
