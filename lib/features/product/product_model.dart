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
  @HiveField(4)
  DateTime dateTime;

  ProductModel({
   required this.productID,
   required this.productName,
   required this.productNum,
   required this.productDetail,
   required this.dateTime,
  });

  ProductModel copyWith({
    required String productID,
    required String productName,
    required int productNum,
    required String productDetail,
    required DateTime dateTime,
  }) {
    return ProductModel(
      productID: productID,
      productName: productName,
      productNum: productNum,
      productDetail: productDetail,
      dateTime: dateTime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productID': productID,
      'productName': productName,
      'productNum': productNum,
      'productDetail': productDetail,
      'dateTime': dateTime,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productID: json['productID'] as String,
      productName: json['productName'] as String,
      productNum: json['productNum'] as int,
      productDetail: json['productDetail'] as String,
      dateTime: json['dateTime'] as DateTime,
    );
  }

  @override
  String toString() =>
      "Product(productID: $productID,productName: $productName,productNum: $productNum,productDetail: $productDetail, dateTime:$dateTime)";

  @override
  int get hashCode =>
      Object.hash(productID, productName, productNum, productDetail,dateTime);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductModel &&
              runtimeType == other.runtimeType &&
              productID == other.productID &&
              productName == other.productName &&
              productNum == other.productNum &&
              productDetail == other.productDetail&&
              dateTime == other.dateTime;
}
