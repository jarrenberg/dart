/*14- Haz un pequeño programa en Dart que simule el lanzamiento de un dado. Investiga la
librería ‘dart:math’ en la documentación oficial*/
import 'dart:io';
import 'dart:math';
void main(){
    int numCaras = 0;
    while(numCaras<5){
      stdout.write("Introduzca el numero de caras:");
      numCaras=int.parse(stdin.readLineSync()!);
    }
    int valor = Random().nextInt(6);
}