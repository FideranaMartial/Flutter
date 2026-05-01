abstract class Personne {
  final String nom;
  final String prenom;
  final int age;
  final String email;
  final String telephone;
  final String adresse;
  final DateTime? dateNaissance;
  String role = 'Personne';

  Personne({
    required this.nom,
    required this.prenom,
    required this.age, 
    required this.email, 
    required this.telephone, 
    required this.adresse, 
    this.dateNaissance
  });

  void afficherInformations() {
    print('Je suis $nom $prenom, âgé de $age ans, email: $email, téléphone: $telephone, adresse: $adresse');
  }

  void afficherRole() {
    print('Je suis un $role');
  }
}