import 'package:flutter/material.dart';

class FamilyTree extends StatefulWidget {
  const FamilyTree({super.key});

  @override
  State<FamilyTree> createState() => _FamilyTreeState();
}

class _FamilyTreeState extends State<FamilyTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Arbre généalogique')),
      body: Column(
        children: [
          Row(
            children: [
              Card(
                elevation: 10,
                shadowColor: const Color.fromARGB(255, 27, 26, 26),
                child: SizedBox(
                  height: 200,
                  width: 250,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          'assets/photo.jpg',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Nom : Maurice'),
                      Text('Situation matrimoniale : Marié'),
                      Text('Adresse : Ambohibehasina'),
                      Text('Contact : 0381456123'),
                      Text('Lien avec vous : Grand-père'),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20),
              Card(
                elevation: 10,
                shadowColor: const Color.fromARGB(255, 27, 26, 26),
                child: SizedBox(
                  height: 200,
                  width: 250,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          'assets/photo.jpg',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Nom : Marcelline'),
                      Text('Situation matrimoniale : Mariée'),
                      Text('Adresse : Ambohibehasina'),
                      Text('Contact : 0381456123'),
                      Text('Lien avec vous : Grand-mère'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //2nd row
          SizedBox(height: 20),
          Row(
            children: [
              Card(
                elevation: 10,
                shadowColor: const Color.fromARGB(255, 27, 26, 26),
                child: SizedBox(
                  height: 200,
                  width: 250,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          'assets/photo.jpg',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Nom : Martial'),
                      Text('Situation matrimoniale : Marié'),
                      Text('Adresse : Manakambahiny'),
                      Text('Contact : 0381456123'),
                      Text('Lien avec vous : Père'),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20),
              Card(
                elevation: 10,
                shadowColor: const Color.fromARGB(255, 27, 26, 26),
                child: SizedBox(
                  height: 200,
                  width: 250,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          'assets/photo.jpg',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Nom : Angeline'),
                      Text('Situation matrimoniale : Mariée'),
                      Text('Adresse : Manakambahiny'),
                      Text('Contact : 0381456123'),
                      Text('Lien avec vous : Mère'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
