import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {this.fieldKey,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.focusNode,
      this.textInputAction,
      this.controller});

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final TextEditingController controller;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      controller: widget.controller,
      obscureText: _obscureText,
      maxLength: 8,
      textInputAction: widget.textInputAction,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      style: TextStyle(fontSize: 14.0),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(fontSize: 14.0),
        suffixIcon: GestureDetector(
          dragStartBehavior: DragStartBehavior.down,
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            /* semanticLabel: _obscureText
                ? GalleryLocalizations.of(context)
                    .demoTextFieldShowPasswordLabel
                : GalleryLocalizations.of(context)
                    .demoTextFieldHidePasswordLabel, */
          ),
        ),
      ),
    );
  }
}
