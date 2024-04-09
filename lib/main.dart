import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:senotokuafor/features/product/product_model.dart';
import 'package:senotokuafor/features/product/product_view_model.dart';
import 'package:senotokuafor/product/utility/constants/boxes.dart';
import 'package:senotokuafor/product/utility/constants/text_constant.dart';

import 'features/product/product_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter('senOtoKuafor');
  Hive.registerAdapter(ProductModelAdapter());
  productBox=await Hive.openBox<ProductModel>(TextConstant.productBox);


  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>ProductViewModel()),
  ],
  child: const SenOtoKuafor(),
  ));
}

class SenOtoKuafor extends StatelessWidget {
  const SenOtoKuafor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductView(),
    );
  }
}
