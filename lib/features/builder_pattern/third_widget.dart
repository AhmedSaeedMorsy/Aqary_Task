// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ThirdWidget extends StatefulWidget {
  final int counter;
  final VoidCallback onIncrement;

  const ThirdWidget(
      {super.key, required this.counter, required this.onIncrement});

  @override
  _ThirdWidgetState createState() => _ThirdWidgetState();
}

class _ThirdWidgetState extends State<ThirdWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Third Counter: ${widget.counter}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: widget.onIncrement,
          child: const Text(
            'Increment',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
