import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ContadorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContadorPage extends StatefulWidget {
  @override
  _ContadorStatePage createState() => _ContadorStatePage();
}

class _ContadorStatePage extends State<ContadorPage> {
  int contador = 0;

  void incrementar() {
    setState(() {
      contador++;
    });
  }

  // void decrementar() {}

  void reset() {
    setState(() {
      contador = 0;
    });
  }

  void decrementar(BuildContext context) {
    if (contador <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('O número não pode ser negativo!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    setState(() {
      contador--;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador Flutter'),
        backgroundColor: Colors.black45,
        titleTextStyle: TextStyle(
          fontSize: 22,
          color: const Color.fromARGB(255, 19, 48, 97),
        ),
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Você clicou no botão ",
              style: TextStyle(
                fontSize: 25,
                color: const Color.fromARGB(255, 18, 28, 41),
              ),
            ),


            Text(
              "$contador",
              style: TextStyle(
                fontSize: 48,
                color: const Color.fromARGB(255, 43, 46, 53),
              ),
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: incrementar,
                  child: Text("Incrementar"),
                ),


                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => decrementar(context),
                  child: Text("Decrementar"),
                ),


                SizedBox(width: 30),
                ElevatedButton(onPressed: reset, child: Text("Resetar")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
