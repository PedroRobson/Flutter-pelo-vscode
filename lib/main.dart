import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TokenValidator(),
    );
  }
}

class TokenValidator extends StatefulWidget {
  @override
  _TokenValidatorState createState() => _TokenValidatorState();
}

class _TokenValidatorState extends State<TokenValidator> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _tokenController = TextEditingController();

  void _validateToken() {
    String token = _tokenController.text.trim();
    if (token == "sport1987") {
      _showDialog("Token Válido");
    } else {
      _showDialog("Token Inválido");
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Resultado"),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(

              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Fechar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Validador de Token"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _tokenController,
                decoration: InputDecoration(
                  labelText: "Token",
                  prefixIcon: Icon(Icons.vpn_key),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {

                    return "Digite um token";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {

                    _validateToken();
                  }
                },
                child: Text("Verificar Token"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
