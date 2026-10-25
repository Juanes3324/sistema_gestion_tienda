
import 'dart:io';
import 'package:sistema_gestion_tienda/services/gestion_productos.dart';
void main() {
  GestionProductos gestion = GestionProductos();
  bool continuar = true;

  print('================================');
  print(' SISTEMA DE GESTIÓN DE TIENDA');
  print('================================');

  while (continuar) {
    print('\n1. Registrar producto');
    print('2. Consultar todos los productos');
    print('3. Buscar producto');
    print('4. Modificar producto');
    print('5. Eliminar producto');
    print('6. Mostrar resumen');
    print('0. Salir');

    stdout.write('\nSelecciona una opción: ');
    String opcion = stdin.readLineSync() ?? '';

    switch (opcion) {
      case '1':
        gestion.registrarProducto();
        break;

      case '2':
        gestion.consultarProductos();
        break;

      case '3':
        gestion.buscarProducto();
        break;

      case '4':
        gestion.modificarProducto();
        break;

      case '5':
        gestion.eliminarProducto();
        break;

      case '6':
        gestion.mostrarResumen();
        break;

      case '0':
        continuar = false;
        print('Gracias por utilizar el sistema.');
        break;

      default:
        print('Opción inválida. Intenta nuevamente.');
    }
  }
}
