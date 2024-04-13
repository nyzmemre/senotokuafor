import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:senotokuafor/product/widgets/my_scaffold.dart';

import 'product_model.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key, required this.item}) : super(key: key);
  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        appBar: AppBar(title: Text('Ürün Detay'),),
        child: Center(
      child: Padding(
        padding: context.padding.normal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            detailCard('Ürün Kodu     :   ', item.productID),
            detailCard('Ürün Adı      :   ', item.productName),
            detailCard('Ürün Kodu     :   ', item.productNum.toString()),
            detailCard('Ürün Tarihi   :   ', item.dateTime.toString()),
            detailCard('Ürün Detayı   :   ', item.productDetail),
          ],
        ),
      ),
    ));
  }

  Widget detailCard(String cardName, String detail) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(cardName),
        Text(detail),
      ],
    );
  }
}
