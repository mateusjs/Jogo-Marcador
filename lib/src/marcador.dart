import 'package:flutter/material.dart';
import 'package:foda_se/src/insere_nome.dart';

class Marcador extends StatefulWidget {
  @override
  _MarcadorState createState() => _MarcadorState();
}

class _MarcadorState extends State<Marcador> {
  TextEditingController _textFieldController = TextEditingController();
  List<String> teste = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("teste"),
      ),
      body: fodase(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _displayDialog(context);
        },
      ),
    );
  }

  fodase() {
    return ListView.separated(
      itemCount: teste == null ? 0 : teste.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(
              teste[index], 
              style:TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              )),
            subtitle: Text(
              "Valor da pontuação atual",
            style: TextStyle(
              fontSize: 17
            )),
            trailing: ButtonTheme(
              minWidth: 10,
              child: RaisedButton(
                child: Icon(Icons.control_point),
                onPressed: () {},
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }

  _displayDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Jogador'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Nome do Jogador"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: Text('OK'),
                onPressed: () {
                  teste.add(_textFieldController.text);
                  _textFieldController.clear();
                  setState(() {});
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
