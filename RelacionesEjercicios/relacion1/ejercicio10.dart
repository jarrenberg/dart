/*10- Haz un programa en Dart que calcule la suma de los n primeros números naturales. El
valor de n será inicializado en el propio programa.*/
import 'dart:io';

void main(){
  int n = -1;
  while(n<=0){
  stdout.write("Introduzca un numero natural:\n");
  n= int.parse(stdin.readLineSync()!);
  }
  int resultado=0;
  for(int i =0;i<=n;i++){
    resultado=resultado+i;
  }
  print("El resultado de los $n primeros numeros naturales es $resultado");
}