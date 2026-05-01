import 'personne.dart';

class FemmeDeMenage extends Personne {
    String role = 'Femme de ménage';
  FemmeDeMenage({
    required String nom,
    required String prenom,
    required int age,
    required String email,
    required String telephone,
    required String adresse,
    DateTime? dateNaissance,
  }) : super(
    nom: nom,
    prenom: prenom,
    age: age,
    email: email,
    telephone: telephone,
    adresse: adresse,
    dateNaissance: dateNaissance
  );

    @override
  void afficherRole() {
    print('Je suis une $role');
  }
}

void main(){
  FemmeDeMenage fdm = new FemmeDeMenage(
    nom: "Durand",
    prenom: "Marie",
    age: 40,
    email: "marie.durand@example.com",
    telephone: "0123456789",
    adresse: "456 Avenue des Champs-Élysées, 75008 Paris",
  );
  fdm.afficherInformations();
  fdm.afficherRole();
}
