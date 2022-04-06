import 'package:evernote/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('  Welcome To Flutter !!!Register Here!')),
      body: Column(
        children: [
          Image.asset(
            'assets/top.jpeg',
            height: 120,
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(hintText: 'Enter Email'),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: 'Enter Password'),
          ),
          const SizedBox(
            height: 15,
          ),
          RaisedButton(
              onPressed: () async {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));

                setState() {}
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text('Sign Up')),
        ],
      ),
    );
  }
}
