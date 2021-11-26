import 'package:flutter/material.dart';
import '/services/auth.dart';
import 'package:provider/provider.dart';

import 'signuphome.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 250.0,
              child: TextField(
                controller: _emailcontroller,
                autofocus: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  labelText: "Email",
                  //errorText: (!_isNameValid) ? 'Fill in all the fields' : '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              width: 250.0,
              child: TextField(
                controller: _passcontroller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.mail,
                  ),
                  labelText: 'Password',
                  //errorText: (!_isEmailValid) ? 'Fill in all the fields' : '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                child: const Text("Sign In"),
                onPressed: () {
                  // print(_emailcontroller.text.trim());
                  context.read<AuthenticationService>().signIn(
                        email: _emailcontroller.text.trim(),
                        password: _passcontroller.text.trim(),
                      );
                },
              ),
            ),
            Container(
              child: OutlinedButton(
                child: const Text("Sign Up"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
