
import 'dart:io';
import '../models/producto.dart';

class GestionProductos {
  // List: almacena los productos registrados.
  final List<Producto> productos = [];

  // Set: almacena las categorías sin repetirlas.
  final Set<String> categorias = {};

  // Map: relaciona cada ID con su producto.
  final Map<int, Producto> productosPorId = {};

  int siguienteId = 1;

  // Registra un producto nuevo.
  void registrarProducto() {
    print('\n--- REGISTRAR PRODUCTO ---');

    stdout.write('Nombre: ');
    String nombre = (stdin.readLineSync() ?? '').trim();

    if (nombre.isEmpty) {
      print('Error: el nombre no puede estar vacío.');
      return;
    }

    stdout.write('Categoría: ');
    String categoria = (stdin.readLineSync() ?? '').trim();

    if (categoria.isEmpty) {
      print('Error: la categoría no puede estar vacía.');
      return;
    }

    stdout.write('Precio: ');
    double? precio = double.tryParse(
      (stdin.readLineSync() ?? '').trim().replaceAll(',', '.'),
    );

    if (precio == null || !precio.isFinite || precio <= 0) {
      print('Error: ingresa un precio válido mayor que cero.');
      return;
    }

    stdout.write('Cantidad disponible: ');
    int? stock = int.tryParse(stdin.readLineSync() ?? '');

    if (stock == null || stock < 0) {
      print('Error: la cantidad debe ser un entero igual o mayor que cero.');
      return;
    }

    Producto producto = Producto(
      id: siguienteId,
      nombre: nombre,
      categoria: categoria,
      precio: precio,
      stock: stock,
    );

    productos.add(producto);
    productosPorId[producto.id] = producto;
    categorias.add(categoria);

    siguienteId++;

    print('Producto registrado correctamente.');
    print('ID asignado: ${producto.id}');
  }

  // Consulta todos los productos.
  void consultarProductos() {
    print('\n--- LISTADO DE PRODUCTOS ---');

    if (productos.isEmpty) {
      print('No hay productos registrados.');
      return;
    }

    for (Producto producto in productos) {
      producto.mostrarInformacion();
    }
  }

  // Busca un producto por su ID.
  Producto? buscarPorId(int id) {
    return productosPorId[id];
  }

  // Permite buscar por ID o por nombre.
  void buscarProducto() {
    print('\n--- BUSCAR PRODUCTO ---');
    print('1. Buscar por ID');
    print('2. Buscar por nombre');
    stdout.write('Selecciona una opción: ');

    String opcion = stdin.readLineSync() ?? '';

    if (opcion == '1') {
      stdout.write('Ingresa el ID: ');
      int? id = int.tryParse(stdin.readLineSync() ?? '');

      if (id == null || id <= 0) {
        print('ID inválido.');
        return;
      }

      Producto? producto = buscarPorId(id);

      if (producto == null) {
        print('No se encontró el producto.');
      } else {
        producto.mostrarInformacion();
      }
    } else if (opcion == '2') {
      stdout.write('Ingresa el nombre: ');
      String nombre = (stdin.readLineSync() ?? '').trim();

      if (nombre.isEmpty) {
        print('Debes escribir un nombre.');
        return;
      }

      List<Producto> encontrados = productos.where((producto) {
        return producto.nombre.toLowerCase() ==
            nombre.toLowerCase();
      }).toList();

      if (encontrados.isEmpty) {
        print('No se encontró el producto.');
      } else {
        for (Producto producto in encontrados) {
          producto.mostrarInformacion();
        }
      }
    } else {
      print('Opción inválida.');
    }
  }

  // Modifica los datos de un producto existente.
  void modificarProducto() {
    print('\n--- MODIFICAR PRODUCTO ---');

    stdout.write('Ingresa el ID del producto: ');
    int? id = int.tryParse(stdin.readLineSync() ?? '');

    if (id == null || id <= 0) {
      print('ID inválido.');
      return;
    }

    Producto? producto = buscarPorId(id);

    if (producto == null) {
      print('No se encontró el producto.');
      return;
    }

    print('Deja un campo vacío para conservar su valor actual.');

    stdout.write('Nuevo nombre (${producto.nombre}): ');
    String nombre = (stdin.readLineSync() ?? '').trim();

    if (nombre.isNotEmpty) {
      producto.nombre = nombre;
    }

    stdout.write('Nueva categoría (${producto.categoria}): ');
    String categoria = (stdin.readLineSync() ?? '').trim();

    if (categoria.isNotEmpty) {
      producto.categoria = categoria;
    }

    stdout.write('Nuevo precio (${producto.precio}): ');
    String entradaPrecio = (stdin.readLineSync() ?? '').trim();

    if (entradaPrecio.isNotEmpty) {
      double? precio = double.tryParse(
        entradaPrecio.replaceAll(',', '.'),
      );

      if (precio == null || !precio.isFinite || precio <= 0) {
        print('Precio inválido. Se conserva el anterior.');
      } else {
        producto.precio = precio;
      }
    }

    stdout.write('Nuevo stock (${producto.stock}): ');
    String entradaStock = (stdin.readLineSync() ?? '').trim();

    if (entradaStock.isNotEmpty) {
      int? stock = int.tryParse(entradaStock);

      if (stock == null || stock < 0) {
        print('Stock inválido. Se conserva el anterior.');
      } else {
        producto.stock = stock;
      }
    }

    // Actualiza las categorías utilizadas.
    categorias
      ..clear()
      ..addAll(productos.map((producto) => producto.categoria));

    print('Producto actualizado correctamente.');
  }

  // Elimina un producto.
  void eliminarProducto() {
    print('\n--- ELIMINAR PRODUCTO ---');

    stdout.write('Ingresa el ID del producto: ');
    int? id = int.tryParse(stdin.readLineSync() ?? '');

    if (id == null || id <= 0) {
      print('ID inválido.');
      return;
    }

    Producto? producto = productosPorId[id];

    if (producto == null) {
      print('No se encontró el producto.');
      return;
    }

    stdout.write('¿Eliminar "${producto.nombre}"? (s/n): ');
    String confirmacion = (stdin.readLineSync() ?? '').trim().toLowerCase();

    if (confirmacion != 's') {
      print('Operación cancelada.');
      return;
    }

    productos.remove(producto);
    productosPorId.remove(id);

    categorias
      ..clear()
      ..addAll(productos.map((producto) => producto.categoria));

    print('Producto eliminado correctamente.');
  }

  // Muestra un resumen del inventario.
  void mostrarResumen() {
    print('\n--- RESUMEN DEL INVENTARIO ---');

    int totalProductos = productos.length;
    int totalUnidades = 0;
    double valorTotal = 0;

    for (Producto producto in productos) {
      totalUnidades += producto.stock;
      valorTotal += producto.calcularValorInventario();
    }

    print('Referencias de productos: $totalProductos');
    print('Unidades disponibles: $totalUnidades');
    print('Categorías registradas: ${categorias.length}');
    print('Valor total del inventario: \$${valorTotal.toStringAsFixed(2)}');

    if (categorias.isNotEmpty) {
      print('Categorías: ${categorias.join(', ')}');
    }
  }
}
