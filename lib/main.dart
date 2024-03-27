import 'package:flutter/material.dart';
// import 'widgets/custom_widget.dart';
import 'routers/page1.dart';
import 'routers/page2.dart';
import 'routers/page3.dart';

void main() => runApp(const MaterialApp(
      title: 'Hu Junlei App',
      home: MyApp(),
    ));
var data = [
  'Hello',
  'World',
  'Hello',
  'World',
  'Hello',
  'World',
  'Hello',
  'World',
];
const TextStyle textStyle = TextStyle(
  color: Colors.cyan,
  fontSize: 32,
  fontWeight: FontWeight.w600,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('my first app')),
        body: Center(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Page1()),
                    );
                  },
                  child: const Text('Open layout route'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Page2()),
                    );
                  },
                  child: const Text('Open state route'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Page3()),
                    );
                  },
                  child: const Text('Open pass vakue route'),
                ),
              ]),
        ));
  }
}
