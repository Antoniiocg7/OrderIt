import 'package:flutter/material.dart';
import 'package:order_it/model/Cliente.dart';
import 'package:order_it/services/ClientService.dart';

class AgregarClientePage extends StatefulWidget {
  const AgregarClientePage({super.key});

  @override
  _AgregarClientePageState createState() => _AgregarClientePageState();
}

class _AgregarClientePageState extends State<AgregarClientePage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              controller: _correoController,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextFormField(
              controller: _direccionController,
              decoration: const InputDecoration(labelText: 'Dirección'),
            ),
            TextFormField(
              controller: _telefonoController,
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Guardar el cliente
                _guardarCliente();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 80), // Ajustar el tamaño del botón
              ),
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  void _guardarCliente() {
    // Obtener los valores de los campos
    String nombre = _nombreController.text;
    String correo = _correoController.text;
    String direccion = _direccionController.text;
    String telefono = _telefonoController.text;

    // Crear un objeto Cliente con los valores
    Cliente nuevoCliente = Cliente(
      // Puedes dejar el ID vacío si se generará automáticamente en Firebase
      nombre: nombre,
      correo: correo,
      direccion: direccion,
      telefono: telefono,
    );

    // Llamar al método para agregar el cliente en el servicio
    //ClientService().agregarCliente(nuevoCliente).then((_) {
    // Si se agrega correctamente, cerrar la página y volver a la anterior
    Navigator.pop(context, true);
    //}).catchError((error) {
    // Si hay un error, mostrar un mensaje
    //ScaffoldMessenger.of(context).showSnackBar(
    //SnackBar(content: Text('Error al guardar el cliente: $error')),
    //);
    //});
  }
}
