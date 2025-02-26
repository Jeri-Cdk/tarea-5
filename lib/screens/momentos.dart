import 'package:flutter/material.dart';

class Momento {
  final String titulo;
  final String imagen;
  final String descripcion;
  final String videoUrl;

  Momento(
      {required this.titulo,
      required this.imagen,
      required this.descripcion,
      required this.videoUrl});
}

class MomentosScreen extends StatelessWidget {
  MomentosScreen({super.key});

  final List<Momento> momentos = [
    Momento(
      titulo: 'Primer encuentro',
      imagen: 'https://example.com/momento1.png',
      descripcion: 'El primer encuentro entre Atsushi y Dazai.',
      videoUrl: 'https://www.youtube.com/watch?v=example1',
    ),
    Momento(
      titulo: 'Batalla intensa',
      imagen: 'https://example.com/momento2.png',
      descripcion: 'La batalla entre Akutagawa y Atsushi.',
      videoUrl: 'https://www.youtube.com/watch?v=example2',
    ),
    Momento(
      titulo: 'Revelación impactante',
      imagen: 'https://example.com/momento3.png',
      descripcion: 'Dazai revela un secreto crucial.',
      videoUrl: 'https://www.youtube.com/watch?v=example3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Momentos BSD')),
      body: ListView.builder(
        itemCount: momentos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading:
                Image.network(momentos[index].imagen, width: 50, height: 50),
            title: Text(momentos[index].titulo),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetalleMomentoScreen(momento: momentos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetalleMomentoScreen extends StatelessWidget {
  final Momento momento;

  const DetalleMomentoScreen({super.key, required this.momento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(momento.titulo)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(momento.imagen, height: 200),
            const SizedBox(height: 20),
            Text(
              momento.descripcion,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Ver Video'),
            ),
          ],
        ),
      ),
    );
  }
}
