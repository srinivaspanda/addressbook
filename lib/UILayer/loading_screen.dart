import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 1.0,
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
