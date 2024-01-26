// ignore_for_file: library_private_types_in_public_api
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RetryPolicyScreen extends StatefulWidget {
  const RetryPolicyScreen({super.key});

  @override
  _RetryPolicyScreenState createState() => _RetryPolicyScreenState();
}

class _RetryPolicyScreenState extends State<RetryPolicyScreen> {
  bool isLoading = true;
  String data = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const url = 'https://api.example.com/data/faild';
    const retryAttempts = 40;
    var attempt = 1;

    while (attempt <= retryAttempts) {
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          setState(() {
            isLoading = false;
            data = response.body;
          });
          break;
        }
      } catch (e) {
        log('Error: $e');
      }

      attempt++;
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retry Policy Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : data.isNotEmpty
                  ? Text(data)
                  : const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 40,
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Failed to fetch data, Please try again !',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
