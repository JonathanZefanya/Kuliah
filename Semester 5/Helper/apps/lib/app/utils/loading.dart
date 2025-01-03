import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingView  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}