class Livre {
  String titre;
  String auteur;
  int anneePublication;
  bool estEmprunte;

  Livre(
    this.titre, 
    this.auteur, 
    this.anneePublication, 
    {this.estEmprunte = false}
  );

  void emprunter() {
    if (!estEmprunte) {
      estEmprunte = true;
      print('Le livre "$titre" a été emprunté.');
    } else {
      print('Le livre "$titre" est déjà emprunté.');
    }
  }

  void retourner() {
    if (estEmprunte) {
      estEmprunte = false;
      print('Le livre "$titre" a été retourné.');
    } else {
      print('Le livre "$titre" n\'était pas emprunté.');
    }
  }
}
