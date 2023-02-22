import 'package:flutter/material.dart';
import 'package:panda_flutter_ui/panda_flutter_ui.dart';
import 'package:panda_flutter_ui/panda_widgets/html/panda_html_view.dart';

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
            Container(
              height: 400,
              width: 400,
              child: PandaImage(
                remoteImageUrl:
                    'https://estore.panda-eco.com/crmfileshare01/image/panda3/cache/product/100047_11012023171113-300x300.png',
                watermarkImageUrl:
                    'https://estore.panda-eco.com/crmfileshare01/image/panda4/logo/watermark_01022023115628.png',
                isZoomableImage: true,
                isGreyImage: true,
              ),
            ),
            PandaHtmlView(
              data: '''
  <H1>Heading 1</H1>
  <H2>Heading 2</H2>
  <H3>Heading 3</H3>
  <H4>Heading 4</H4>
  <H5>Heading 5</H5>
  <H6>Heading 6</H6>
  <p>Lorem ipsum dolor sit amet, consectetur <a href="https://google.com/">Google!</a> adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
  <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkZfSUuIOGln-FOAW3OSoJquZXRolTjZhseQ&usqp=CAU"/>
    <br/>
    <table>
    <thead>
    <tr><th>One</th><th>Two</th><th>Three</th></tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
    <tr><td>Data</td><td>Data</td><td>Data</td></tr>
    <tr><td>Data</td><td>Data</td><td>Data</td></tr>
    <tr><td>Data</td><td>Data</td><td>Data</td></tr>
    </tfoot>
    </table>''',
              accentColor: Colors.orange[900],
              textColor: Colors.grey[700],
              onLinkTap: (url) {
                print('html url: $url');
              },
            ),
          ],
        ),
      ),
    );
  }
}
