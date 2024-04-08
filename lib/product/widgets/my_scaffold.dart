import 'package:flutter/material.dart';
class MyScaffold extends StatelessWidget {
   const MyScaffold({super.key, required this.child, this.appBar});
  final Widget child;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: appBar,
        body: child
    ));
  }
}