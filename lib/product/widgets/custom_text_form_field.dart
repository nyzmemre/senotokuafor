import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utility/constants/color_constants.dart';
import '../utility/constants/text_constant.dart';
import '../utility/validators/textform_validators.dart';


class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
        required this.labelText,
        this.validator,
        this.keyboardType,
        this.controller,
        this.isVisible,
        this.enabled,
        this.passwordMatch,
        this.onChanged,
        this.inputFormatters,
        this.onEditingComplete,
        this.onFieldSubmitted,
        this.focusNode,

      });

  // ignore: strict_raw_type
  final String labelText;
  final FormFieldValidator<String>? validator;
  final bool? isVisible;
  final TextInputType? keyboardType;
  final bool? enabled;
  final String? passwordMatch;
  final  ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;

  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      obscureText: isVisible ?? false,
      controller: controller,
      enabled: enabled ?? true,
      keyboardType: keyboardType,
      ///validasyon işlemlerinin tamamını textform_validators alanında topladım.
      validator: validator ??
              (value) {
            return TextFormValidator.validateNotEmpty(value, labelText) ??
                TextFormValidator.checkPasswordLenght(value, labelText) ??
                TextFormValidator.validateProductCodeExist(value, controller) ??
                (labelText == TextConstant.mailAdress
                    ? TextFormValidator.validateEmail(value)
                    : null);
          },
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorConstants.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        labelText: labelText,
      ),
    );
  }
}