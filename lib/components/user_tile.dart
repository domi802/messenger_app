// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class userTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const userTile({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            //icon
            const Icon(Icons.person),
            const SizedBox(width: 20),
            //user name
            Text(text),
          ],
        ),
      ),
    );
  }
}
