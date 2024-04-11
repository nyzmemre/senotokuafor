import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:senotokuafor/product/utility/constants/text_constant.dart';

import '../../features/product/product_model.dart';

class SearchWidget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
   return SearchFinder(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchFinder(query: query);

  }
}

class SearchFinder extends StatelessWidget {
  const SearchFinder({Key? key, required this.query, })
      : super(key: key);
  final String query;


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable:
            Hive.box<ProductModel>(TextConstant.productBox).listenable(),
        builder: (context, boxData, _) {
          var result = query.isEmpty
              ? boxData.values.toList()
              : boxData.values
                  .where((element) =>
                      element.productID.contains(query))
                  .toList();
          return result.isEmpty
              ? Center(
                  child: Text(
                    'No results found !',
                  ),
                )
              : ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, int index){
             return Card(
               color: Colors.amberAccent,
               child: ListTile(
                 leading: Text(
                   result[index].productID,
                   style: TextStyle(fontSize: 15),
                 ),
                 title: Text(result[index].productName),
                 subtitle: Row(
                   children: [
                     decraseButton(result, index, boxData),
                     Text(result[index].productNum.toString()),
                     increaseButton(result, index, boxData),

                   ],
                 ),
                 trailing: IconButton(onPressed: (){
                   boxData.deleteAt(index);
                 }, icon: Icon(Icons.delete)),
               ),
             );
          });
        });
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
}
