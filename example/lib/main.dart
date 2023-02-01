import 'package:flutter/material.dart';
import 'package:panda_flutter_ui/panda_flutter_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panda Flutter UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String platformType = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panda Flutter UI"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PandaImage(
              remoteImageUrl:
                  'https://cdn.pixabay.com/photo/2023/01/29/11/34/great-tit-7753050_960_720.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
