import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage("assets/background.png"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 80,
                    child: Row(children: [
                      Icon(Icons.info_outline),
                      Text("INFO", style: TextStyle(fontFamily: 'Pixellari'))
                    ])),
                Container(
                  width: 500,
                  child: Text(
                      "Du kannst dich im Museum frei bewegen, mit Ausnahme eines Raumes, wo sich ein Schatz befindet. Für diesen Raum musst du dir den Schlüssel erspielen. Dafür gehst du zu den Stationen im Museum. Dort erhältst du Buchstaben. Wenn du bei jeder Station gewesen ist, wirst du zur verschlossenen Tür geführt. Dort muss du die gefundenen Buchstaben in der richtigen Reihenfolge eingeben, um die Tür zu öffnen. Im Raum hinter der Tür befindet sich der Schatz.",
                      textAlign: TextAlign.center),
                ),
                Container(
                    width: 127,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.check),
                          Text("Verstanden",
                              style: TextStyle(fontFamily: 'Pixellari'))
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
