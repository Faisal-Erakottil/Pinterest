import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final int index;
  final String url;
  const Tile({super.key, required this.index, required this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Image(image: NetworkImage(url))),
    );
  }
}
