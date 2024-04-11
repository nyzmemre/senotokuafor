import 'package:flutter/material.dart';
class MyScaffold extends StatelessWidget {
   const MyScaffold({super.key, required this.child, this.appBar, this.floatingActionButton});
  final Widget child;
  final PreferredSizeWidget? appBar;
  final FloatingActionButton? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: appBar,
        floatingActionButton: floatingActionButton,
        body: child
    ));
  }
}