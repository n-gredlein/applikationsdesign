import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 166,
                    child: Center(
                        child: Row(children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text("INFO", style: Theme.of(context).textTheme.headline1)
                    ]))),
                Container(
                  width: 300,
                  child: Text(
                    "Du kannst dich im Museum frei bewegen, mit Ausnahme eines Raumes, wo sich ein Schatz befindet. Für diesen Raum musst du dir den Schlüssel erspielen. Dafür gehst du zu den Stationen im Museum. Dort erhältst du Buchstaben. Wenn du bei jeder Station gewesen ist, wirst du zur verschlossenen Tür geführt. Dort muss du die gefundenen Buchstaben in der richtigen Reihenfolge eingeben, um die Tür zu öffnen. Im Raum hinter der Tür befindet sich der Schatz.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                    width: 158,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Row(
                        children: [
                          Text("Verstanden",
                              style: TextStyle(fontFamily: 'Pixellari')),
                          Icon(Icons.check),
                        ],
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.lime)),
                    )),
              ],
            ))));
  }
}
