import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:senotokuafor/features/product/product_model.dart';
import 'package:senotokuafor/features/product/product_view_model.dart';
import 'package:senotokuafor/product/utility/constants/text_constant.dart';
import '../../product/widgets/my_scaffold.dart';
import 'add_product_view.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        appBar: appBarWidget(context),
        child: ValueListenableBuilder(
            valueListenable:
                Hive.box<ProductModel>(TextConstant.productBox).listenable(),
            builder: (context, boxData, _) {
              List<ProductModel> productList =
                  boxData.values.cast<ProductModel>().toList();
              if (productList.isEmpty) {
                return productNotFount(context);
              }
              return ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, int index) {
                    return Card(
                      color: Colors.amberAccent,
                      child: ListTile(
                        leading: Text(
                          productList[index].productID,
                          style: TextStyle(fontSize: 15),
                        ),
                        title: Text(productList[index].productName),
                        subtitle: Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                 /* Provider.of<ProductViewModel>(context).increaseProductNum(productList[index]);*/
                                  print(productList[index].productNum);
                                  productList[index].productNum--;
                                  boxData.putAt(
                                      index,
                                      ProductModel(
                                          productID:
                                              productList[index].productID,
                                          productName: productList[index].productName,
                                          productNum: productList[index].productNum,
                                          productDetail: productList[index].productDetail));
                                },
                                child: Text(
                                  '-',
                                  style: TextStyle(fontSize: 35),
                                )),
                            Text(productList[index].productNum.toString()),
                            TextButton(
                                onPressed: () {
                                  print(productList[index].productNum);
                                  productList[index].productNum++;
                                  boxData.putAt(
                                      index,
                                      ProductModel(
                                          productID:
                                          productList[index].productID,
                                          productName: productList[index].productName,
                                          productNum: productList[index].productNum,
                                          productDetail: productList[index].productDetail));                                },
                                child: Text(
                                  '+',
                                  style: TextStyle(fontSize: 25),
                                )),

                          ],
                        ),
                        trailing: IconButton(onPressed: (){
                          boxData.deleteAt(index);
                        }, icon: Icon(Icons.delete)),
                      ),
                    );
                  });
            }));
  }

  AppBar appBarWidget(BuildContext context) {
    return AppBar(
      title: Text('Ürünler'),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AddProductView()));
            },
            icon: const Icon(Icons.add_circle))
      ],
    );
  }

  Center productNotFount(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(TextConstant.productNotFound),
          context.sized.emptySizedHeightBoxNormal,
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddProductView()));
              },
              child: const Text(TextConstant.addProduct))
        ],
      ),
    );
  }
}
