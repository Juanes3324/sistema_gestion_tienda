class Producto {
  int id;
  String nombre;
  String categoria;
  double precio;
  int stock;

  // Constructor: permite crear un producto con sus datos.
  Producto({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.precio,
    required this.stock,
  });

  // Método para mostrar la información del producto.
  void mostrarInformacion() {
    print('ID: $id');
    print('Nombre: $nombre');
    print('Categoría: $categoria');
    print('Precio: \$${precio.toStringAsFixed(2)}');
    print('Stock disponible: $stock');
    print('-----------------------------');
  }

  // Calcula el valor total del inventario de este producto.
  double calcularValorInventario() {
    return precio * stock;
  }
}