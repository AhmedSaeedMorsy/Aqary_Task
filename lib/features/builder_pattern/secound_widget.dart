// ignore_for_file: library_private_types_in_public_api

import 'package:aqary_test/features/builder_pattern/third_widget.dart';
import 'package:flutter/material.dart';

class SecoundWidget extends StatefulWidget {
  final int counter;
  final VoidCallback onIncrement;

  const SecoundWidget(
      {super.key, required this.counter, required this.onIncrement});

  @override
  _SecoundWidgetState createState() => _SecoundWidgetState();
}

class _SecoundWidgetState extends State<SecoundWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Secound Counter: ${widget.counter}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ThirdWidget(
          counter: widget.counter,
          onIncrement: widget.onIncrement,
        ),
      ],
    );
  }
}
