import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  final String title;
  final void Function(String) onChanged;
  final Color corCaixa;
  final bool isObscure;
  final bool isMaxLine;
  final int maxLines;
  final TextInputType keyBoardAppearance;
  final Icon iconsPos;

  const CustomTextFormFieldWidget({
    required this.title,
    required this.onChanged,
    required this.corCaixa,
    required this.isObscure,
    required this.isMaxLine,
    required this.maxLines,
    required this.keyBoardAppearance,
    required this.iconsPos,
  });

  @override
  _CustomTextFormFieldWidgetState createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      maxLines: widget.isMaxLine ? widget.maxLines : null,
      onChanged: widget.onChanged,
      obscureText: widget.isObscure,
      keyboardType: widget.keyBoardAppearance,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        suffixIcon: widget.iconsPos,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: widget.corCaixa),
        ),
        labelText: widget.title,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: widget.corCaixa),
        ),
        contentPadding: EdgeInsets.only(
          left: 15,
          bottom: 15,
          top: 15,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: widget.corCaixa),
        ),
      ),
    );
  }
}
