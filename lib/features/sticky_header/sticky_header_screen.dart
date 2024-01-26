import 'package:flutter/material.dart';

class StickyHeaderScreen extends StatelessWidget {
  const StickyHeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sticky Header Example'),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('Item ${index + 1}'),
                );
              },
              childCount: 3,
            ),
          ),
          const SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bouncing Sticky Header',
                ),
                Icon(
                  Icons.push_pin_outlined,
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('Item ${index + 4}'),
                );
              },
              childCount: 150,
            ),
          ),
        ],
      ),
    );
  }
}
