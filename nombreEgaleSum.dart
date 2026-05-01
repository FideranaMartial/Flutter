void nombreEgaleSum(List<int> liste, int sum){
 List <List> petiteListe = [];
  for (int i=0; i<liste.length; i++){
    for(int j=i+1; j<liste.length; j++){
      if (liste[i]+liste[j] == sum){
        petiteListe.add([liste[i], liste[j]]);
      }
    }
  }
  return print(petiteListe);
}

void main(){
  List<int> liste = [2, 4, 6, 3, 1, 5];
  int sum = 7;
  nombreEgaleSum(liste, sum);

}