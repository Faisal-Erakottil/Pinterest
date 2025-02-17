import 'package:flutter/material.dart';
import 'package:pinterest/presentation/BottumAdd/customwidget.dart';

void addButton(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.black,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "stat creating now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOption(Icons.push_pin, "Pin"),
                buildOption(Icons.crop, "Collage"),
                buildOption(Icons.grid_view, "Board"),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
