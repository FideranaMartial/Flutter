import 'package:flutter/material.dart';

// Modèle pour un membre de la famille
class FamilyMember {
  final String id;
  final String name;
  final String photoUrl; // URL ou asset path
  final String maritalStatus;
  final String address;
  final String contact;
  final String relationshipToMe;
  final List<FamilyMember> children;
  final DateTime? birthDate;
  final String? profession;

  FamilyMember({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.maritalStatus,
    required this.address,
    required this.contact,
    required this.relationshipToMe,
    this.children = const [],
    this.birthDate,
    this.profession,
  });
}

// Widget principal de l'arbre familial
class FamilyTreeApp extends StatelessWidget {
  final FamilyMember rootMember;

  const FamilyTreeApp({super.key, required this.rootMember});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Family Tree',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: FamilyTreeHomePage(rootMember: rootMember),
    );
  }
}

// Page d'accueil de l'arbre familial
class FamilyTreeHomePage extends StatefulWidget {
  final FamilyMember rootMember;

  const FamilyTreeHomePage({super.key, required this.rootMember});

  @override
  State<FamilyTreeHomePage> createState() => _FamilyTreeHomePageState();
}

class _FamilyTreeHomePageState extends State<FamilyTreeHomePage> {
  FamilyMember? selectedMember;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Tree - Notre Famille'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              _showInfoDialog(context);
            },
          ),
        ],
      ),
      body: Row(
        children: [
          // Panneau de gauche : Arbre familial
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              child: FamilyTreeView(
                rootMember: widget.rootMember,
                onMemberSelected: (member) {
                  setState(() {
                    selectedMember = member;
                  });
                },
              ),
            ),
          ),
          // Panneau de droite : Détails du membre sélectionné
          Expanded(
            flex: 1,
            child: selectedMember != null
                ? MemberDetailsCard(member: selectedMember!)
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.family_restroom,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Sélectionnez un membre de la famille',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notre Arbre Familial'),
          content: const Text(
            'Bienvenue dans l\'arbre généalogique de notre famille.\n\n'
            'Cliquez sur n\'importe quel membre pour voir ses informations détaillées.\n\n'
            'L\'arbre montre les relations familiales et les liens entre chaque membre.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }
}

// Vue de l'arbre familial
class FamilyTreeView extends StatelessWidget {
  final FamilyMember rootMember;
  final Function(FamilyMember) onMemberSelected;

  const FamilyTreeView({
    super.key,
    required this.rootMember,
    required this.onMemberSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Arbre Généalogique',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 20),
          _buildTreeNode(rootMember),
        ],
      ),
    );
  }

  Widget _buildTreeNode(FamilyMember member) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onMemberSelected(member),
          child: Card(
            elevation: 4,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple[50]!, Colors.deepPurple[100]!],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Photo de profil
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: member.photoUrl.startsWith('http')
                        ? NetworkImage(member.photoUrl)
                        : AssetImage(member.photoUrl) as ImageProvider,
                    child: member.photoUrl.isEmpty
                        ? const Icon(Icons.person, size: 30)
                        : null,
                  ),
                  const SizedBox(width: 12),
                  // Informations
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        member.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        member.relationshipToMe,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.deepPurple[400],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (member.children.isNotEmpty) ...[
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 2,
                height: 30,
                color: Colors.deepPurple[200],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: member.children
                .map((child) => SizedBox(
                      width: 250,
                      child: _buildTreeNode(child),
                    ))
                .toList(),
          ),
        ],
      ],
    );
  }
}

// Carte des détails du membre
class MemberDetailsCard extends StatelessWidget {
  final FamilyMember member;

  const MemberDetailsCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Photo
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: member.photoUrl.startsWith('http')
                      ? NetworkImage(member.photoUrl)
                      : AssetImage(member.photoUrl) as ImageProvider,
                  child: member.photoUrl.isEmpty
                      ? const Icon(Icons.person, size: 60)
                      : null,
                ),
                const SizedBox(height: 12),
                Text(
                  member.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    member.relationshipToMe,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.deepPurple[800],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 20),
          _buildInfoTile(Icons.favorite, 'Situation matrimoniale', member.maritalStatus),
          _buildInfoTile(Icons.home, 'Adresse', member.address),
          _buildInfoTile(Icons.phone, 'Contact', member.contact),
          if (member.birthDate != null)
            _buildInfoTile(Icons.cake, 'Date de naissance', 
                '${member.birthDate!.day}/${member.birthDate!.month}/${member.birthDate!.year}'),
          if (member.profession != null)
            _buildInfoTile(Icons.work, 'Profession', member.profession!),
          const SizedBox(height: 20),
          if (member.children.isNotEmpty) ...[
            const Divider(),
            const SizedBox(height: 10),
            Text(
              'Enfants : ${member.children.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...member.children.map((child) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.child_care, size: 16, color: Colors.deepPurple),
                      const SizedBox(width: 8),
                      Text(child.name),
                    ],
                  ),
                )),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: Colors.deepPurple[400]),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Helper pour créer facilement des membres de la famille
class FamilyTreeBuilder {
  static FamilyMember createSampleFamily() {
    return FamilyMember(
      id: '1',
      name: 'Jean Dupont',
      photoUrl: '',
      maritalStatus: 'Marié à Marie Dupont',
      address: '12 Rue des Lilas, 75000 Paris',
      contact: '+33 6 12 34 56 78',
      relationshipToMe: 'Père',
      birthDate: DateTime(1965, 5, 15),
      profession: 'Ingénieur',
      children: [
        FamilyMember(
          id: '2',
          name: 'Sophie Dupont',
          photoUrl: '',
          maritalStatus: 'Mariée à Paul Martin',
          address: '8 Avenue des Champs, 69000 Lyon',
          contact: '+33 6 23 45 67 89',
          relationshipToMe: 'Sœur',
          birthDate: DateTime(1990, 8, 22),
          profession: 'Médecin',
          children: [
            FamilyMember(
              id: '4',
              name: 'Lucas Martin',
              photoUrl: '',
              maritalStatus: 'Célibataire',
              address: '8 Avenue des Champs, 69000 Lyon',
              contact: '+33 6 34 56 78 90',
              relationshipToMe: 'Neveu',
              birthDate: DateTime(2015, 3, 10),
            ),
            FamilyMember(
              id: '5',
              name: 'Emma Martin',
              photoUrl: '',
              maritalStatus: 'Célibataire',
              address: '8 Avenue des Champs, 69000 Lyon',
              contact: '+33 6 45 67 89 01',
              relationshipToMe: 'Nièce',
              birthDate: DateTime(2018, 7, 25),
            ),
          ],
        ),
        FamilyMember(
          id: '3',
          name: 'Thomas Dupont',
          photoUrl: '',
          maritalStatus: 'Marié à Claire Dupont',
          address: '25 Rue de la République, 13000 Marseille',
          contact: '+33 6 56 78 90 12',
          relationshipToMe: 'Frère',
          birthDate: DateTime(1992, 11, 5),
          profession: 'Architecte',
          children: [
            FamilyMember(
              id: '6',
              name: 'Noah Dupont',
              photoUrl: '',
              maritalStatus: 'Célibataire',
              address: '25 Rue de la République, 13000 Marseille',
              contact: '+33 6 67 89 01 23',
              relationshipToMe: 'Neveu',
              birthDate: DateTime(2019, 1, 18),
            ),
          ],
        ),
      ],
    );
  }
}