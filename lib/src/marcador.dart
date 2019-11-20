import 'package:flutter/material.dart';
import 'package:foda_se/Model/jogador.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Marcador extends StatefulWidget {
  @override
  _MarcadorState createState() => _MarcadorState();
}

class _MarcadorState extends State<Marcador> {
  TextEditingController _textFieldController = TextEditingController();
  List<Jogador> teste = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("teste"),
      ),
      body: fodase(),
      floatingActionButton: SpeedDial(
          marginRight: 18,
          marginBottom: 20,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          // If true user is forced to close dial manually
          // by tapping main button and overlay is not rendered.
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
                child: Icon(Icons.accessibility),
                backgroundColor: Colors.red,
                label: 'Add Jogador',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () {}),
            SpeedDialChild(
              child: Icon(Icons.brush),
              backgroundColor: Colors.blue,
              label: 'Zerar o Jogo',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {},
            )
          ]),
    );
  }

// FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           _displayDialog(context);
//         },
//       )

  fodase() {
    return ListView.separated(
      itemCount: teste == null ? 0 : teste.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTileTheme(
            selectedColor: Colors.red,
            child: ListTile(
              selected: teste[index].emJogo ? false : true,
              title: Text(teste[index].nome,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              subtitle: Text(
                  teste[index].emJogo == true
                      ? "${teste[index].pontos} Pontos"
                      : "ELIMINADO",
                  style: TextStyle(fontSize: 17)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 10,
                    child: RaisedButton(
                      child: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        if (teste[index].pontos > 4) {
                          teste[index].emJogo = true;
                          teste[index].pontos = 4;
                        } else {
                          if (teste[index].pontos != 0)
                            teste[index].pontos -= 1;
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  ButtonTheme(
                    minWidth: 10,
                    child: RaisedButton(
                      child: Icon(Icons.control_point),
                      onPressed: () {
                        if (teste[index].pontos > 4) {
                          teste[index].emJogo = false;
                        } else {
                          teste[index].pontos += 1;
                          if (teste[index].pontos > 4)
                            teste[index].emJogo = false;
                        }
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
              onLongPress: () {
                teste.removeAt(index);
                setState(() {});
              },
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
                  Jogador jogador = new Jogador();
                  jogador.nome = _textFieldController.text;
                  jogador.pontos = 0;
                  jogador.emJogo = true;
                  teste.add(jogador);
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
