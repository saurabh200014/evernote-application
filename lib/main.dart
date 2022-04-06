import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo here
            Image.asset('assets/top.jpeg'),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Evernote'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Positioned.fill(
              //
              child: Image(
                image: AssetImage('assets/top.jpeg'),
                fit: BoxFit.fill,
                height: 150.0,
                width: 400.0,
              ),
            ),
            Divider(
              color: Colors.grey[800],
              height: 60.0,
            ),
            const Text(
              'Welcome',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 4.0,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Tanmay Mahajan',
              style: TextStyle(
                color: Colors.amberAccent[200],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Take a tour',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(
                width: 400.0,
                height: 150.0,
                child: Card(
                    color: Colors.grey,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: 8,
                        decoration: InputDecoration.collapsed(
                            hintText: "Enter your text here"),
                      ),
                    ))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => const Login()));
        },
        tooltip: 'New',
        child: const Text("New",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }
}
