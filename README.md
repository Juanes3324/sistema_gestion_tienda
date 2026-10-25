# Sistema de Gestión de Productos de una Tienda

## 1. Descripción del proyecto

El Sistema de Gestión de Productos de una Tienda es una aplicación desarrollada en Dart que funciona mediante una consola. Su propósito es facilitar la administración básica de un inventario, permitiendo registrar, consultar, buscar, modificar y eliminar productos.

El sistema también genera un resumen con la cantidad de referencias registradas, las unidades disponibles, las categorías y el valor total del inventario.

Este proyecto se desarrolla como parte del Momento Evaluativo 1 de la asignatura Lenguaje de Programación para APPs de la Universidad Cooperativa de Colombia.

## 2. Objetivo general

Desarrollar una aplicación de consola en Dart que permita gestionar productos de una tienda mediante operaciones básicas de inventario, aplicando los fundamentos de programación y las estructuras de datos estudiadas en clase.

## 3. Funcionalidades

- Registrar productos con identificador, nombre, categoría, precio y cantidad disponible.
- Consultar todos los productos registrados.
- Buscar productos por identificador o nombre.
- Modificar los datos de un producto.
- Eliminar productos registrados.
- Generar un resumen del inventario.
- Validar los datos ingresados por el usuario.
- Navegar mediante un menú interactivo por consola.

## 4. Tecnologías utilizadas

- Lenguaje de programación Dart.
- Visual Studio Code como entorno de desarrollo.
- Git y GitHub para el control de versiones y el seguimiento del desarrollo.

## 5. Estructura del proyecto

- `bin/main.dart`: contiene el punto de entrada y el menú principal.
- `lib/models/producto.dart`: define la clase Producto, sus atributos, constructor y métodos.
- `lib/services/gestion_productos.dart`: contiene las operaciones de administración del inventario.
- `README.md`: presenta la documentación del proyecto.

## 6. Instrucciones de ejecución

1. Instalar el SDK de Dart.
2. Abrir la carpeta del proyecto en Visual Studio Code.
3. Abrir una terminal en la carpeta raíz del proyecto.
4. Ejecutar el siguiente comando:

   `dart run bin/main.dart`

5. Seleccionar una opción del menú e ingresar los datos solicitados.

## 7. Investigación: clases y objetos

### ¿Qué es una clase?

Una clase es una estructura que define las características y los comportamientos que tendrán los objetos creados a partir de ella. En este proyecto, la clase `Producto` establece qué información debe tener cada producto de la tienda.

### ¿Qué es un objeto?

Un objeto es una instancia concreta de una clase. En el sistema, cada producto registrado se representa mediante un objeto que contiene su identificador, nombre, categoría, precio y stock.

### ¿Cuál es la diferencia entre una clase y un objeto?

La clase define una estructura general, mientras que el objeto representa un elemento específico creado a partir de esa estructura. Por ejemplo, `Producto` es la clase, mientras que una cámara registrada con un precio y una cantidad determinados es un objeto.

### ¿Qué es un atributo?

Un atributo es una variable declarada dentro de una clase que representa una característica de sus objetos. En la clase `Producto`, los atributos son `id`, `nombre`, `categoria`, `precio` y `stock`.

### ¿Qué es un método?

Un método es una función definida dentro de una clase que representa una acción o comportamiento. En este proyecto, `mostrarInformacion()` presenta los datos de un producto y `calcularValorInventario()` calcula el valor de sus unidades disponibles multiplicando el precio por el stock.

### ¿Para qué sirve un constructor?

Un constructor permite inicializar un objeto al momento de crearlo, asignando los valores necesarios a sus atributos. En la clase `Producto`, el constructor recibe los datos que identifican y describen cada producto.

## 8. Estructuras de datos utilizadas

### List

La lista `productos` almacena los objetos registrados y permite recorrerlos para consultar el inventario.

### Set

El conjunto `categorias` almacena las categorías sin repetirlas, lo que permite conocer cuántas categorías distintas existen.

### Map

El mapa `productosPorId` relaciona el identificador de cada producto con su objeto. Esto facilita la búsqueda directa por ID.

## 9. Validaciones

El sistema comprueba que el nombre y la categoría no estén vacíos, que el precio sea un número válido mayor que cero, que el stock sea un entero igual o superior a cero y que el identificador ingresado corresponda a un producto registrado cuando se realizan operaciones sobre él.

## 10. Alcance y limitaciones

La aplicación funciona exclusivamente por consola y mantiene los datos en memoria mientras el programa está ejecutándose. No utiliza bases de datos, API ni interfaz gráfica. Por lo tanto, los registros se pierden cuando se cierra el programa.

## 11. Autor

Proyecto académico individual desarrollado para la asignatura Lenguaje de Programación para APPs, correspondiente al Momento Evaluativo 1.
