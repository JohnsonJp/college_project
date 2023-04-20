import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_fonts/google_fonts.dart';
import 'camerapage.dart';

void main() {
  // Ensure that plugin services are initialized so that `availableCameras()`
// can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nōgyō enjo',
          style: GoogleFonts.roboto(),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/pestlogo.png'),
            ),
            Container(
                child: Text('Pest Detection',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ))),
            SizedBox(height: 50),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(

                        style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                        onPressed: () async {
                          await availableCameras().then((value) =>
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) =>
                                      CameraPage(cameras: value))));
                        },

                        child: Text('Capture',
                            style: GoogleFonts.roboto(fontSize: 18))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

