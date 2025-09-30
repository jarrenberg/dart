/*8- Haz un programa en Dart que muestre la tabla de multiplicar de un número entero (entre
1 y 10) que se introducirá por consola. Investiga la función stdin.readLineSync() para
realizar entrada de datos desde consola. ¿Qué ocurre con el sistema “sound type”?.
Soluciónalo utilizando un tipo nullable. Testea la entrada sometiéndola a distintas pruebas
de datos de entrada.*/
import 'dart:io';

void main(){
  stdout.write("Introduzca un numero:\n");
  int? n = int.parse(stdin.readLineSync()!);
  for(int i =1; i<=10;i++){
    print("$n*$i=${(i*n)}");
  }
}