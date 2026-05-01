void main(){
  checkNombreFrequent([1, 2, 3, 4, 5, 1, 2, 1]);
}

checkNombreFrequent(List<int> list){
  int count = 0;
  int maxCount = 0;
  int plusfrequent = 0;
  for(int i = 0; i < list.length; i++){
    for (int j = i + 1; j < list.length; j++){
      if(list[i] == list[j]){
        count++;
      }
    }
    if (count > maxCount) {
      maxCount = count;
      plusfrequent = list[i];
    }
  }
    print("Le nombre le plus fréquent est : $plusfrequent");
  return plusfrequent;
}