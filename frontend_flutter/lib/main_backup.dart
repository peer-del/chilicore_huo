import 'package:flutter/material.dart';

void main() {
  runApp(const PKApp());
}

class PKApp extends StatelessWidget {
  const PKApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "PKApp", home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Login Page"),
        ),
        body: Container(
          width: double.infinity,
          color: Colors.cyan.withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  child: Text("Peerapat"), color: Colors.purple.withOpacity(0.5),
              ),
            ],
          ),
        ),
    );
  }
}