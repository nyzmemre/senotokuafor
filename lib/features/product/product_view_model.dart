import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:senotokuafor/features/product/product_model.dart';
import 'package:senotokuafor/product/utility/constants/text_constant.dart';

class ProductViewModel extends ChangeNotifier{
  final productBox=Hive.box<ProductModel>(TextConstant.productBox);

  Future<void> addHiveProduct(ProductModel product) async {
    await productBox.put(product.productID, product);
  }

  increaseProductNum(ProductModel product){
    product.productNum++;
    notifyListeners();
  }

  decraseProductNum(ProductModel product){
    if(product.productNum!=0) {
      product.productNum--;
    } else {
      product.productNum=0;
    }
    notifyListeners();
  }
}