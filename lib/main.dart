import 'package:flutter/material.dart';

import 'features/product/product_view.dart';

void main() {
  runApp(const SenOtoKuafor());
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
