/*12- Calcula en Dart el MCD de dos números enteros positivos utilizando el algoritmo de
Euclides*/

import 'dart:io';

void main(){
  int n1 = -1;
  int n2 = -1;
  while(n1<=0){
     stdout.write("Introduce un numero entero y positivo:");
    n1 = int.parse(stdin.readLineSync()!);
  }

  while(n2<=0){
     stdout.write("Introduce un numero entero y positivo:");
    n2 = int.parse(stdin.readLineSync()!);
  }
  MiClase m = new MiClase();
  m.mcdEuclides();


}

 class MiClase {
      int mcdEuclides() {
        return 1;
      }
    }