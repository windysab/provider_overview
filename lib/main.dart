import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Managing App without Provider',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Overview 01'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.blue[100],
              child: const Text(
                'MyHomePage',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CounterA(counter: counter, increment: increment),
            const SizedBox(
              height: 20.0,
            ),
            Middle(counter: counter)
          ],
        ),
      ),
    );
  }
}

class CounterA extends StatelessWidget {
  const CounterA({
    Key? key,
    required this.counter,
    required this.increment,
  }) : super(key: key);

  final int counter;
  final VoidCallback increment;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            '$counter',
            style: const TextStyle(fontSize: 48.0),
          ),
          ElevatedButton(
            onPressed: increment,
            child: const Text("Increment", style: TextStyle(fontSize: 20.0)),
          )
        ],
      ),
    );
  }
}

class Middle extends StatelessWidget {
  const Middle({
    Key? key,
    required this.counter,
  }) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CounterB(counter: counter),
          const SizedBox(
            width: 20.0,
          ),
          const Sibling(),
        ],
      ),
    );
  }
}

class CounterB extends StatelessWidget {
  const CounterB({
    Key? key,
    required this.counter,
  }) : super(key: key);
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      padding: const EdgeInsets.all(10.0),
      child: Text(
        '$counter',
        style: const TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class Sibling extends StatelessWidget {
  const Sibling({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      padding: const EdgeInsets.all(10.0),
      child: const Text(
        'Sibling',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
