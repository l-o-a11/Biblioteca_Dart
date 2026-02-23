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

      case 2:
        listarLibros(biblioteca);
        break;

      case 3:
        actualizarLibro(biblioteca);
        break;

      case 4:
        eliminarLibro(biblioteca);
        break;

      case 0:
        print("Saliendo del programa...");
        break;

      default:
        print("Opción no válida.");
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
    print('\nError: Datos inválidos.');
    return;
  }

  biblioteca.add({
    'titulo': titulo,
    'autor': autor,
    'anio': anio,
  });

  print('\nLibro agregado correctamente.');
}

void listarLibros(List<Map<String, dynamic>> biblioteca) {
  if (biblioteca.isEmpty) {
    print('\nNo hay libros registrados.');
    return;
  }

  print('\n--- Lista de libros ---');
  for (int i = 0; i < biblioteca.length; i++) {
    print('Índice: $i');
    print('Título: ${biblioteca[i]['titulo']}');
    print('Autor: ${biblioteca[i]['autor']}');
    print('Año: ${biblioteca[i]['anio']}');
    print('-----------------------');
  }
}

void actualizarLibro(List<Map<String, dynamic>> biblioteca) {
  if (biblioteca.isEmpty) {
    print("\nNo hay libros para actualizar.");
    return;
  }

  listarLibros(biblioteca);

  stdout.write("\nIngrese el índice del libro a actualizar: ");
  int? indice = int.tryParse(stdin.readLineSync() ?? '');

  if (indice == null || indice < 0 || indice >= biblioteca.length) {
    print("Índice inválido.");
    return;
  }

  stdout.write("Nuevo título: ");
  String? nuevoTitulo = stdin.readLineSync();

  stdout.write("Nuevo autor: ");
  String? nuevoAutor = stdin.readLineSync();

  stdout.write("Nuevo año: ");
  int? nuevoAnio = int.tryParse(stdin.readLineSync() ?? '');

  if (nuevoTitulo == null || nuevoTitulo.isEmpty ||
      nuevoAutor == null || nuevoAutor.isEmpty ||
      nuevoAnio == null) {
    print("Error: Datos inválidos.");
    return;
  }

  biblioteca[indice] = {
    'titulo': nuevoTitulo,
    'autor': nuevoAutor,
    'anio': nuevoAnio,
  };

  print("Libro actualizado correctamente.");
}

void eliminarLibro(List<Map<String, dynamic>> biblioteca) {
  if (biblioteca.isEmpty) {
    print('\nNo hay libros para eliminar.');
    return;
  }

  listarLibros(biblioteca);

  stdout.write('\nIngrese el índice del libro a eliminar: ');
  int? indice = int.tryParse(stdin.readLineSync() ?? '');

  if (indice == null || indice < 0 || indice >= biblioteca.length) {
    print('Índice inválido.');
    return;
  }

  biblioteca.removeAt(indice);
  print('Libro eliminado correctamente.');
}