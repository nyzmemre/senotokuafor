import 'package:flutter/material.dart';
import 'package:senotokuafor/product/widgets/my_scaffold.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: ListView(
      children: List.generate(15, (index) => Card(
        color: Colors.amberAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListTile(
            leading: Text('Ürün Kodu', style: TextStyle(fontSize: 20),),
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
