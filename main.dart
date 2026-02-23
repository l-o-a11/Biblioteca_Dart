import 'dart:io';

// Importaciones
import 'punto1.dart';
import 'punto2.dart';
import 'punto3.dart';
import 'punto4.dart';

void main() {
  int opcion;

  do {
    print("\n========== MENÚ LIBRERIA ==========");
    print("1. Agregar Libro");
    print("2. Listar Libros");
    print("3. Actualizar Libro");
    print("4. Eliminar Libro");
    print("0. Salir");
    stdout.write("Seleccione una opción: ");

    opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {

      case 0:
        print("Saliendo del programa...");
        break;

      default:
        print("Opción no válida.");
    }
  } while (opcion != 0);
}
