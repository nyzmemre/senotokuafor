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
   ProductView({Key? key}) : super(key: key);
   final _key=GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

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
              return Form(
                key: _key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: searchController,
                      onChanged: (val){
                        if(val.isNotEmpty){

                           if(boxData.keys.any((element) => element==searchController.text)){
                             ProductModel _result=boxData.get(searchController.text)!;
                             productList=[ProductModel(productID: _result.productID, productName: _result.productName, productNum: _result.productNum, productDetail: _result.productDetail)];
                           }else{
                             productList=[];

                          }
                        } else {
                          productList=boxData.values.cast<ProductModel>().toList();
                        }

                      },
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: productList.length,
                        itemBuilder: (context, int index) {
                          return cardWidget(productList, index, boxData);
                        }),
                  ],
                ),
              );
            }));
  }

  Card cardWidget(List<ProductModel> productList, int index, Box<ProductModel> boxData) {
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
                                decraseButton(productList, index, boxData),
                                Text(productList[index].productNum.toString()),
                                increaseButton(productList, index, boxData),

                              ],
                            ),
                            trailing: IconButton(onPressed: (){
                              boxData.deleteAt(index);
                            }, icon: Icon(Icons.delete)),
                          ),
                        );
  }

  TextButton increaseButton(List<ProductModel> productList, int index, Box<ProductModel> boxData) {
    return TextButton(
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
                                    ));
  }

  TextButton decraseButton(List<ProductModel> productList, int index, Box<ProductModel> boxData) {
    return TextButton(
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
                                    ));
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
