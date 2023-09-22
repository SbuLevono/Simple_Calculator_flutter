import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("General Calculator"),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {},
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            height: 230,
            width: 500,
            padding: const EdgeInsets.only(right: 20),
            color: Colors.black,
            child: const Text(
              "0",
              style: TextStyle(
                fontSize: 80,
                color: Colors.white,
              ),
            ),
          ),
          const Expanded(
            child: Column(
              children: [
                RowOfButtons(
                  buttons: ["C", "()", "%", "/"],
                ),
                RowOfButtons(
                  buttons: ["7", "8", "9", "*"],
                ),
                RowOfButtons(
                  buttons: ["4", "5", "6", "+"],
                ),
                RowOfButtons(
                  buttons: ["1", "2", "3", "-"],
                ),
                RowOfButtons(
                  buttons: ["0", "00", ".", "="],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowOfButtons extends StatelessWidget {
  final List<String> buttons;

  const RowOfButtons({required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((text) => CalculatorButton(text)).toList(),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;

  const CalculatorButton(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 60,
      margin: const EdgeInsets.only(left: 10, top: 10),
      decoration: BoxDecoration(
          border: Border.all(
        color: const Color.fromARGB(255, 222, 212, 212),
      )),
      child: MaterialButton(
        onPressed: () {},
        color: text == "=" ? Colors.blue : Colors.white,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 300,
            child: const Center(
              child: Text("Calculators",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.attach_money),
                  title: const Text(
                    "Currency Convertor",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.fitness_center),
                  title: const Text(
                    "Weight Converter",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
