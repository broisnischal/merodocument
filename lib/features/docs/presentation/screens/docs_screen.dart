import 'package:auto_route/auto_route.dart';
// import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'DocsPageRoute')
class DocsScreen extends StatelessWidget {
  const DocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (ctx, index) {
          return Center(
            child: Column(
              children: [
                Text(index.toString()),
                TextButton(
                  onPressed: () => context.router.maybePop(),
                  child: const Text('Back'),
                ),
              ],
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
