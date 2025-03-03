import 'package:flutter/material.dart';
import '../widgets/prolapse_card.dart';

class ProlapseScreen extends StatefulWidget {
  @override
  _ProlapseScreenState createState() => _ProlapseScreenState();
}

class _ProlapseScreenState extends State<ProlapseScreen> {
  String selectedOption = 'Choose a prolapse example';

  // Fonction pour afficher la boîte de dialogue de confirmation
  void _showDialog(BuildContext context, String selectedOption) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Selection'),
          content: Text('You selected: $selectedOption. Do you want to proceed?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Ferme le dialog sans faire d'action
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Ferme le dialog et effectue l'action si nécessaire
                // Vous pouvez ajouter ici des actions supplémentaires après la confirmation
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  // Fonction pour afficher un message ou une action lors du clic sur une carte
  void _onCardClicked(String cardTitle) {
    // Affiche un message dans la console ou vous pouvez effectuer une autre action
    print('Card clicked: $cardTitle');

    // Par exemple, vous pouvez afficher un pop-up ou une action spécifique ici
    _showDialog(context, cardTitle); // Affiche un pop-up de confirmation pour la carte cliquée
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Prolapse Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown
            DropdownButton<String>(
              value: selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
                // Afficher le dialog de confirmation après la sélection
                if (selectedOption != 'Choose a prolapse example') {
                  _showDialog(context, selectedOption);
                }
              },
              items: <String>[
                'Choose a prolapse example',
                'Example 1',
                'Example 2'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            // Boutons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("With uterus")),
                const SizedBox(width: 10),
                OutlinedButton(onPressed: () {}, child: const Text("Without uterus")),
              ],
            ),

            const SizedBox(height: 20),

            // Grille avec cartes cliquables
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, // 3 colonnes
                children: [
                  GestureDetector(
                    onTap: () => _onCardClicked('Aa'), // Ajoute l'événement de clic
                    child: const ProlapseCard(title: "Aa", value: "-3", subtitle: "anterior wall"),
                  ),
                  GestureDetector(
                    onTap: () => _onCardClicked('Ba'), // Ajoute l'événement de clic
                    child: const ProlapseCard(title: "Ba", value: "-3", subtitle: "anterior wall"),
                  ),
                  GestureDetector(
                    onTap: () => _onCardClicked('C'), // Ajoute l'événement de clic
                    child: const ProlapseCard(title: "C", value: "-8", subtitle: "cervix or cuff"),
                  ),
                  GestureDetector(
                    onTap: () => _onCardClicked('gh'), // Ajoute l'événement de clic
                    child: const ProlapseCard(title: "gh", value: "2", subtitle: "genital hiatus"),
                  ),
                  GestureDetector(
                    onTap: () => _onCardClicked('pb'), // Ajoute l'événement de clic
                    child: const ProlapseCard(title: "pb", value: "3", subtitle: "perineal body"),
                  ),
                  GestureDetector(
                    onTap: () => _onCardClicked('tvl'), // Ajoute l'événement de clic
                    child: const ProlapseCard(title: "tvl", value: "10", subtitle: "total vaginal length"),
                  ),
                  GestureDetector(
                    onTap: () => _onCardClicked('Ap'), // Ajoute l'événement de clic
                    child: const ProlapseCard(title: "Ap", value: "-3", subtitle: "posterior wall"),
                  ),
                  GestureDetector(
                    onTap: () => _onCardClicked('Bp'), // Ajoute l'événement de clic
                    child: const ProlapseCard(title: "Bp", value: "-3", subtitle: "posterior wall"),
                  ),
                  GestureDetector(
                    onTap: () => _onCardClicked('D'), // Ajoute l'événement de clic
                    child: const ProlapseCard(title: "D", value: "-10", subtitle: "posterior fornix"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}