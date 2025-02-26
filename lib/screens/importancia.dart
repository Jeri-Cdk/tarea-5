import 'package:flutter/material.dart';

class EnMiVidaScreen extends StatelessWidget {
  const EnMiVidaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('En mi vida')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Por qué Bungou Stray Dogs es importante para mí',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Icon(Icons.videocam, size: 50, color: Colors.blueGrey),
            SizedBox(height: 10),
            Text(
              'Video explicativo',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
