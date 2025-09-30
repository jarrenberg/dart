/*11- Haz el pequeño programa en Dart que calcule el factorial de un número n inicializado a
un valor entero y positivo*/
import 'dart:io';

void main(){
int n = 0;
while(n<=0){
  stdout.write("Introduce un numero entero y positivo:");
  n = int.parse(stdin.readLineSync()!);
}
int resultado =1;
for(int i=n;i>=1;i--){
    resultado=resultado*i;
  }
stdout.write("\nEl resultado del factorial de $n es $resultado");
}
