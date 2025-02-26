import 'package:flutter/material.dart';

class Personaje {
  final String nombre;
  final String imagen;
  final String descripcion;

  Personaje(
      {required this.nombre, required this.imagen, required this.descripcion});
}

class PersonajesScreen extends StatelessWidget {
  PersonajesScreen({super.key});

  final List<Personaje> personajes = [
    Personaje(
      nombre: 'Atsushi Nakajima',
      imagen:
          'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/CBR-Featured-Image-Atsushi-Nakajima-Bungo-Stray-Dogs.jpg',
      descripcion:
          'El protagonista de la serie con la habilidad de transformarse en tigre.',
    ),
    Personaje(
      nombre: 'Osamu Dazai',
      imagen:
          'https://i.pinimg.com/originals/95/a6/19/95a619db90abcce359d311df313f5fec.jpg',
      descripcion:
          'Un detective excéntrico con la habilidad de anular poderes.',
    ),
    Personaje(
      nombre: 'Ranpo Edogawa',
      imagen:
          'https://i.pinimg.com/736x/70/92/97/709297d70f7cec228511d6bfc74bd9d0.jpg',
      descripcion:
          'Miembro de la agencia con habilidades de deducción infalibles.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personajes BSD')),
      body: ListView.builder(
        itemCount: personajes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(personajes[index].imagen),
            ),
            title: Text(personajes[index].nombre),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetallePersonajeScreen(personaje: personajes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetallePersonajeScreen extends StatelessWidget {
  final Personaje personaje;

  const DetallePersonajeScreen({super.key, required this.personaje});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(personaje.nombre)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(personaje.imagen, height: 200),
            const SizedBox(height: 20),
            Text(
              personaje.descripcion,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
