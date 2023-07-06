import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          Container(),
          TextFormField(
            decoration: const InputDecoration(label: Text("xxxx")),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("xxxx"))
        ],
      ),
    );
  }
}
