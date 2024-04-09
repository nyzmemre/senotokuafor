import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../product/widgets/my_scaffold.dart';
import 'add_product_view.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        appBar: AppBar(
          title: Text('Ürünler'),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>AddProductView()));
            }, icon: Icon(Icons.add_circle))
          ],
        ),
        child: ListView(
      children: List.generate(15, (index) => Padding(
        padding: context.padding.low,
        child: Card(
          color: Colors.amberAccent,
          child: ListTile(
            leading: Text('Ürün Kodu', style: TextStyle(fontSize: 15),),
            title: Text('Ürün Adı'),
            subtitle: Row(
              children: [
                TextButton(onPressed: (){}, child: Text('-', style: TextStyle(fontSize: 35),)),
                Text('15'),
                TextButton(onPressed: (){}, child: Text('+', style: TextStyle(fontSize: 25),)),
              ],
            ),
            trailing: TextButton(onPressed: (){}, child: Text('Detay')),

          ),
        ),
      )),
    ));
  }
}
