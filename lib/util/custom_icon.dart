import 'package:flutter/material.dart';
import 'package:foda_se/Model/jogador.dart';

class CustomIcon {
  final List<Jogador> lista;
  final VoidCallback callback;

  CustomIcon({this.lista, this.callback});
}

class CustomIconState extends StatelessWidget {
  final List<Jogador> lista;
  final VoidCallback callback;

  CustomIconState({this.lista, this.callback});

  @override
  Widget build(BuildContext context) {
    generatePlayer(List<Jogador> players) {
      if (players.length > 0 || players != null) {
        for (int i = 0; i < players.length; i++) {
          return Container(
              child: FractionalTranslation(
            translation: Offset(0.0, -4.5),
            child: Image.network(
              'https://icon-library.net/images/' +
                  'person-icon-png-transparent/person-icon-png-transparent-5.jpg',
              width: 40,
            ),
          ));
        }
      } else
        return Container();
    }

    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: Center(
              child: RotatedBox(
                quarterTurns: 1,
                child: Image.network('http://www.buildyourownpokertables.com' +
                    '/images/stories/ovalpokertable.png'),
              ),
            ),
          ),
          Container(
            child: FractionalTranslation(
              translation: Offset(0.0, -4.5),
              child: Image.network(
                'https://icon-library.net/images/' +
                    'person-icon-png-transparent/person-icon-png-transparent-5.jpg',
                width: 40,
              ),
            ),
          ),
          generatePlayer(lista)
        ],
      ),
    );
  }
}
