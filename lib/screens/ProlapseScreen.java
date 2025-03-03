import 'package:flutter/material.dart';
import '../widgets/prolapse_card.dart';

class ProlapseScreen extends StatefulWidget {
  @override
  _ProlapseScreenState createState() => _ProlapseScreenState();
}

class _ProlapseScreenState extends State<ProlapseScreen> {
  String selectedOption = 'Choose a prolapse example';

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

            // Grille
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, // 3 colonnes
                children: const [
                  ProlapseCard(title: "Aa", value: "-3", subtitle: "anterior wall"),
                  ProlapseCard(title: "Ba", value: "-3", subtitle: "anterior wall"),
                  ProlapseCard(title: "C", value: "-8", subtitle: "cervix or cuff"),
                  ProlapseCard(title: "gh", value: "2", subtitle: "genital hiatus"),
                  ProlapseCard(title: "pb", value: "3", subtitle: "perineal body"),
                  ProlapseCard(title: "tvl", value: "10", subtitle: "total vaginal length"),
                  ProlapseCard(title: "Ap", value: "-3", subtitle: "posterior wall"),
                  ProlapseCard(title: "Bp", value: "-3", subtitle: "posterior wall"),
                  ProlapseCard(title: "D", value: "-10", subtitle: "posterior fornix"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
