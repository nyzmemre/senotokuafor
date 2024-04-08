class Product {
  String productID;
  String productName;
  int productNum;
  String productDetail;

  Product({
   required this.productID,
   required this.productName,
   required this.productNum,
   required this.productDetail,
  });

  Product copyWith({
    required String productID,
    required String productName,
    required int productNum,
    required String productDetail,
  }) {
    return Product(
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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
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
          other is Product &&
              runtimeType == other.runtimeType &&
              productID == other.productID &&
              productName == other.productName &&
              productNum == other.productNum &&
              productDetail == other.productDetail;
}
