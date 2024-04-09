import 'package:flutter/material.dart';

@immutable
class TextConstant{
  const TextConstant._();
  static const String appVersion="1.0.3";
  static const String appName = 'Şen Oto Kuaför';
  static const String mailAdress='Mail Adresi';
  static const String password='Şifre';



  ///form Error Texts
  static const String notEmpty='alanı boş olamaz.';
  static const String passwordNotSame='Şifreleriniz aynı olmalıdır.';
  static const String validateEmail='Lütfen geçerli bir mail adresi giriniz!';

}