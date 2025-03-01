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
      imagen: 'https://preview.redd.it/every-time-atsushi-looks-at-dazai-after-he-does-a-good-deed-v0-fbwttikq8az81.jpg?width=1080&crop=smart&auto=webp&s=f186bcdf62f6935a97e52d7425c4e53be0c4174f',
      descripcion: 'El primer encuentro entre Atsushi y Dazai.',
      videoUrl: 'https://www.youtube.com/watch?v=example1',
    ),
    Momento(
      titulo: 'Batalla intensa',
      imagen: 'https://static.wikia.nocookie.net/bungo-stray-dogs/images/4/4e/Atsushi_atacando_a_Akutagawa.png/revision/latest/scale-to-width-down/1000?cb=20220719195301&path-prefix=es',
      descripcion: 'La batalla entre Akutagawa y Atsushi.',
      videoUrl: 'https://www.youtube.com/watch?v=example2',
    ),
    Momento(
      titulo: 'Revelación impactante',
      imagen: 'https://preview.redd.it/d804diffnpg91.jpg?auto=webp&s=53a3b83e7ce764d33bfcf8ff676ee2d8fdb68ea1',
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
