import 'personne.dart';

class Adherent extends Personne {
  final int? id;
  final DateTime? dateInscription;
  String role = 'Adhérent';

  Adherent({
    required String nom,
    required String prenom,
    required int age,
    required String email,  
    required String telephone,
    required String adresse,
    DateTime? dateNaissance,
    this.id,
    this.dateInscription,
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
  Adherent adherent = new Adherent(
    nom: "ANDIAHERTSE",
    prenom: "Fiderana Martial",
    age: 20,
    email: "martialandiahertse@example.com",
    telephone: "0342558404",
    adresse: "Tanambao",
    dateNaissance: DateTime(2005, 3, 12)
  );
  adherent.afficherInformations();
  adherent.afficherRole();
}
