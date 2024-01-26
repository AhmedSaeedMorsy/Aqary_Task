import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/bloc.dart';
import '../controller/event.dart';
import '../controller/states.dart';

class AsencGeneratorScreen extends StatelessWidget {
  const AsencGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Generator Example'),
      ),
      body: BlocBuilder<AsyncGeneratorBloc, AsyncGeneratorBaseStates>(
        builder: (context, state) {
          if (state is AsyncGeneratorLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AsyncGeneratorSuccessState) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.data[index]),
                );
              },
            );
          } else if (state is AsyncGeneratorErrorState) {
            return const Center(
              child: Text('Error occurred while fetching data.'),
            );
          }

          return const Center(
            child: Text(
              "click on Generate",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xff4B72A9),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          AsyncGeneratorBloc.get(context).add(AsyncGeneratorEvent());
        },
        label: const Row(
          children: [
            Text("Generate"),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.refresh),
          ],
        ),
      ),
    );
  }
}
