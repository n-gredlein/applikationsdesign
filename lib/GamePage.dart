import 'package:flutter/material.dart';
import 'package:flutter_application_kagan_gredlein/app_routes.dart';

class GamePage extends StatelessWidget {
  Widget _startDialog(BuildContext context) {
    return new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text("Du bist jetzt in der Fabrik..."),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            height: 170,
            fit: BoxFit.cover,
            image: AssetImage('assets/images/ghost_right.png'),
          ),
          Text(
              "Suche hier nach Buchstaben, um den Schlüssel zum Schatz zu bekommen."),
        ],
      ),
      actions: <Widget>[
        Container(
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lime)),
              child: const Text('Weiter'),
            )),
      ],
    );
  }

  Widget _infoDialog(BuildContext context) {
    return new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text("Ausstellungsstück Name"),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            height: 170,
            fit: BoxFit.cover,
            image: AssetImage(''),
          ),
          Text("Hier gibt es ein paar Infos zum Austellungstück."),
          Image(
            height: 170,
            fit: BoxFit.cover,
            image: AssetImage(''),
          ),
        ],
      ),
      actions: <Widget>[
        Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lime)),
              child: const Text('Buchstabe einsammeln'),
            )),
      ],
    );
  }

  Widget _finishDialog(BuildContext context) {
    return new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text("Sehr gut, du hast alle Buchstaben gefunden!"),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              "Jetzt kannst du dich jetzt auf die Suche nach der Tür zum Schatz machen."),
        ],
      ),
      actions: <Widget>[
        Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lime)),
              child: const Text('Weiter'),
            )),
      ],
    );
  }

  Widget _solutionDialog(BuildContext context) {
    return new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text("Du hast es fast geschafft"),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              "Bringe noch die gesammelten Buchstaben in die richtige Reihenfolge, um die Schatztruhe zu öffnen."),
          TextField(),
        ],
      ),
      actions: <Widget>[
        Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lime)),
              child: const Text('Schatz öffnen'),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.pause);
              },
              child: Row(
                children: [
                  Icon(Icons.pause),
                  Text(
                    "Pause",
                  )
                ],
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber)),
            )));
  }
}
