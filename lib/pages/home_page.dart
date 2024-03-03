// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:messenger_app/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: MyDrawer(),
    );
  }
}
