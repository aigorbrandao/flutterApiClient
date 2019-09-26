import 'package:flutter/material.dart';
import 'package:http_request/Pages/home.page.dart';
import 'package:http_request/Services/login.service.dart';

String response;

// Define a custom Form widget.
class LoginPage extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<LoginPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final loginController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    loginController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: loginController,
            ),
            TextField(
              controller: senhaController,
            ),
          ],
        ),
      ),
      floatingActionButton: RaisedButton(
          onPressed: () {
            postLogin(loginController.text, senhaController.text)
                .then((result) {
              if (result.message == 'OK') {
                // Direciona para homepage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              } else {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Usuário ou senha incorretos!'),
                    );
                  },
                );
              }
            });
          },
          child: const Text('Login', style: TextStyle(fontSize: 20))),
    );
  }
}

/*

              getValue(result.accessToken).then((valor) {
                print(valor.toString());
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(valor.toString()),
                    );
                  },
                );
              });
              
              
*/
