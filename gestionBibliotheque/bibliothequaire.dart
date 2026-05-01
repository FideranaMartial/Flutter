import 'personne.dart';

class Bibliothequaire extends Personne {
    String role = 'Bibliothécaire';
  Bibliothequaire({
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
    print('Je suis un $role');
  }
}
void main(){
  Bibliothequaire biblio = new Bibliothequaire(
    nom: "Dupont",
    prenom: "Jean",
    age: 35,
    email: "jean.dupont@example.com",
    telephone: "0123456789",
    adresse: "123 Rue de la Paix, 75000 Paris",
  );
  biblio.afficherInformations();
  biblio.afficherRole();
  }
