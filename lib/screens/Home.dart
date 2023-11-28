import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/Header.dart';
import '../components/Menu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<bool>> parkingMap =
      List.generate(5, (index) => List.generate(4, (index) => true));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context),
      drawer: Menu(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60, // Ajuste a altura conforme necessário
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('BEM VINDO'),
                    // Adicione mais mensagens de boas-vindas se desejar
                  ],
                  totalRepeatCount:
                      4, // Número de vezes que as mensagens serão repetidas
                  pause: const Duration(
                      milliseconds: 1000), // Pausa entre as mensagens
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Mapa de Vagas"),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.grey[200],
              child: Column(
                children: List.generate(
                  parkingMap.length,
                  (row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        parkingMap[row].length,
                        (col) {
                          bool isAvailable = parkingMap[row][col];
                          return GestureDetector(
                            onTap: () {
                              // Handle tapping on the parking spot
                              print(
                                  "Selected Parking Spot: Row $row, Col $col");
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(4.0),
                              color: isAvailable ? Colors.green : Colors.red,
                              child: Center(
                                child: Text(
                                  "${row + 1}${String.fromCharCode(col + 65)}", // Display spot identifier
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
