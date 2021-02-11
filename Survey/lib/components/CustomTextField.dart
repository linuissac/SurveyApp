import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String errorText;
  final TextStyle style;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final Color cursorColor;
  final Widget suffixIcon;
  final TextStyle labelStyle;
  final List<TextInputFormatter> inputFormatters;
  final ValueChanged onchanged;
  final FormFieldSetter onSaved;
  final InputDecoration inputDecoration;
  CustomTextField(
      {this.labelText,
      this.style,
      this.controller,
      this.validator,
      this.keyboardType,
      this.textCapitalization = TextCapitalization.none,
      this.obscureText = false,
      this.cursorColor,
      this.suffixIcon,
      this.labelStyle,
      this.inputFormatters,
      this.onchanged,
      this.errorText,
      this.inputDecoration,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
        style: style ?? Theme.of(context).textTheme.body1,
        cursorColor: cursorColor,
        inputFormatters: inputFormatters,
        decoration: inputDecoration ??
            InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(249, 249, 249, 2),
                errorText: errorText,
                labelStyle: labelStyle ?? Theme.of(context).textTheme.body1,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.7),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.7),
                ),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 1.0,
                )),
                suffixIcon: suffixIcon),
        controller: this.controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onchanged,
        onSaved: onSaved);
  }
}
