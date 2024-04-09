import 'package:hive_flutter/adapters.dart';
part 'product_model.g.dart';
@HiveType(typeId: 1)
class ProductModel {
  @HiveField(0)
  String productID;
  @HiveField(1)
  String productName;
  @HiveField(2)
  int productNum;
  @HiveField(3)
  String productDetail;

  ProductModel({
   required this.productID,
   required this.productName,
   required this.productNum,
   required this.productDetail,
  });

  ProductModel copyWith({
    required String productID,
    required String productName,
    required int productNum,
    required String productDetail,
  }) {
    return ProductModel(
      productID: productID,
      productName: productName,
      productNum: productNum,
      productDetail: productDetail,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productID': productID,
      'productName': productName,
      'productNum': productNum,
      'productDetail': productDetail,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productID: json['productID'] as String,
      productName: json['productName'] as String,
      productNum: json['productNum'] as int,
      productDetail: json['productDetail'] as String,
    );
  }

  @override
  String toString() =>
      "Product(productID: $productID,productName: $productName,productNum: $productNum,productDetail: $productDetail)";

  @override
  int get hashCode =>
      Object.hash(productID, productName, productNum, productDetail);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductModel &&
              runtimeType == other.runtimeType &&
              productID == other.productID &&
              productName == other.productName &&
              productNum == other.productNum &&
              productDetail == other.productDetail;
}
