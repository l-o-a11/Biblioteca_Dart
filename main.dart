import 'dart:io';

void main() {
  int opcion;
  List<Map<String, dynamic>> biblioteca = [];

  do {
    print("\n========== MENÚ LIBRERIA ==========");
    print("1. Agregar Libro");
    print("2. Listar Libros");
    print("3. Actualizar Libro");
    print("4. Eliminar Libro");
    print("0. Salir");
    stdout.write("Seleccione una opción: ");

    opcion = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    switch (opcion) {
      case 1:
        agregarLibro(biblioteca);
        break;

      default:
        print(" Opción no válida.");
    }
  } while (opcion != 0);
}

// ================= FUNCIONES =================

void agregarLibro(List<Map<String, dynamic>> biblioteca) {
  stdout.write('Ingrese el título del libro: ');
  String? titulo = stdin.readLineSync();

  stdout.write('Ingrese el autor del libro: ');
  String? autor = stdin.readLineSync();

  stdout.write('Ingrese el año de publicación: ');
  String? inputAnio = stdin.readLineSync();

  int? anio = int.tryParse(inputAnio ?? '');

  if (titulo == null || titulo.isEmpty ||
      autor == null || autor.isEmpty ||
      anio == null) {
    print('\n Error: Datos inválidos.');
    return;
  }

  biblioteca.add({
    'titulo': titulo,
    'autor': autor,
    'anio': anio,
  });

  print('\n Libro agregado correctamente.');
}

