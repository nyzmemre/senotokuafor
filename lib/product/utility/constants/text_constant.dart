import 'package:flutter/material.dart';

@immutable
class TextConstant{
  const TextConstant._();
  static const String appVersion="1.0.3";
  static const String appName = 'Şen Oto Kuaför';
  static const String mailAdress='Mail Adresi';
  static const String password='Şifre';
  static const String addProduct='Ürün Ekle';
  static const String productCode='Ürün Kodu';
  static const String enterProductCode='Kod Giriniz';
  static const String productName='Ürün Adı';
  static const String enterName='Ad Giriniz';
  static const String numOfStock='Stok Adedi';
  static const String productDetail='Ürün Detayı';
  static const String enterDetail='Detay Giriniz';
  static const String enterNum='Adet Giriniz';



  ///boxes
  static const String productBox='productBox';

  ///page texts
  static const String productNotFound='Herhangi bir ürün eklemediniz. Lütfen ürün ekleyiniz.';

  ///form Error Texts
  static const String notEmpty='alanı boş olamaz.';
  static const String passwordNotSame='Şifreleriniz aynı olmalıdır.';
  static const String validateEmail='Lütfen geçerli bir mail adresi giriniz!';

}