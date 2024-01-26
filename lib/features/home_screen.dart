import 'package:aqary_test/features/builder_pattern/first_screen.dart';
import 'package:aqary_test/features/sticky_header/sticky_header_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/slide_transtion.dart';
import 'asynchronous_generator/controller/bloc.dart';
import 'asynchronous_generator/screen/async_generator_screen.dart';
import 'render_object/custom_paint_screen.dart';
import 'retry_policy/retry_policy_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    SlideTranstion(
                      page: const FirstScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Builder Pattern',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    SlideTranstion(
                      page: BlocProvider<AsyncGeneratorBloc>(
                          create: (context) => AsyncGeneratorBloc(),
                          child: const AsencGeneratorScreen()),
                    ),
                  );
                },
                child: const Text(
                  'Asynchronous Generator',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    SlideTranstion(
                      page: const RenderObjectScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Render Object',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    SlideTranstion(
                      page: const StickyHeaderScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Sticky Header',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    SlideTranstion(
                      page: const RetryPolicyScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Retry Policy',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
