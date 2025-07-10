import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final tasks = Provider.of<TasKProvider>



    return Scaffold(appBar: AppBar(title: Text("TO-DO App")));
  }
}
