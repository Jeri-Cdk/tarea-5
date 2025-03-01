import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tarea5/screens/acerca.dart';
import 'package:tarea5/screens/importancia.dart';
import 'package:tarea5/screens/momentos.dart';
import 'package:tarea5/screens/personajes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bungou Stray Dogs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 183, 83, 58)),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Bungou Stray Dogs'),
    );
  }
}

class Options {
  final String title;
  final Widget screen;

  Options({required this.title, required this.screen});
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final List<Options> options = [
    Options(title: "Personajes", screen: PersonajesScreen()),
    Options(title: "Momentos", screen: MomentosScreen()),
    Options(title: "Acerca de", screen: AcercaDeScreen()),
    Options(title: "Importancia", screen: EnMiVidaScreen()),
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                aspectRatio: 16 / 9,
              ),
              items: [
                "https://imgsrv.crunchyroll.com/cdn-cgi/image/fit=cover,format=auto,quality=85,width=1920/keyart/GR5VXQ8PR-backdrop_wide",
                "https://i0.wp.com/elpalomitron.com/wp-content/uploads/2021/02/Critica-de-Bungou-Stray-Dogs-WAN-destacada-El-Palomitron.jpg?resize=1200%2C600&ssl=1",
                "https://www.omegacenter.es/blog/wp-content/uploads/2020/07/Bungou-Stray-Dogs-Principal.jpg",
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.network(
                          i,
                          fit: BoxFit.cover,
                        ));
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: widget.options.map((e) {
                  return Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => e.screen,
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                            ),
                            child: Text(e.title,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar : AppBar(title : "Contratame", centerTitle: true),
                        body : Center(
                          child : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
          Image.network(
              'https://media.licdn.com/dms/image/v2/D4E03AQHOjvZNaFTFRA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1703870839716?e=1744848000&v=beta&t=z80Dv9QXo1zM719UG_tfkiSX_ySmZ4Cm-lD4GgkDJMY'),
          Text("Jeriel Gomez", style: TextStyle(fontSize: 24)),
          Text("2023 0296", style: TextStyle(fontSize: 24)),
        ],
                            
                          )
                        )
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                  ),
                  child: Text("Contratame!!",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
