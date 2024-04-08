import 'package:flutter/material.dart';
import 'package:senotokuafor/product/widgets/my_scaffold.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: Card(
      child: ListTile(
        
        leading: Text('Ürün Kodu'),
        title: Text('Ürün Adı'),
        subtitle: Row(
          children: [
            TextButton(onPressed: (){}, child: Text('-')),
            Text('15'),
            TextButton(onPressed: (){}, child: Text('+')),
          ],
        ),
        trailing: TextButton(onPressed: (){}, child: Text('Detay')),
        
      ),
    ));
  }
}
