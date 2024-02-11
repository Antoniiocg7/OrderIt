import 'package:flutter/material.dart';

import '../model/Cliente.dart';
import '../services/ClientService.dart';

class ModificarClientePage extends StatefulWidget {
  final Cliente cliente;

  const ModificarClientePage({super.key, required this.cliente});

  @override
  _ModificarClientePageState createState() => _ModificarClientePageState();
}

class _ModificarClientePageState extends State<ModificarClientePage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nombreController.text = widget.cliente.nombre;
    _correoController.text = widget.cliente.correo;
    _direccionController.text = widget.cliente.direccion;
    _telefonoController.text = widget.cliente.telefono;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modificar Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Guardar cambios y volver a la página anterior
                    _guardarCambios();
                  },
                  child: const Text('Aceptar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Volver a la página anterior sin guardar cambios
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Eliminar cliente y volver a la página anterior
                    _eliminarCliente();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Borrar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _guardarCambios() {
    // Obtener los valores de los campos
    String nombre = _nombreController.text;
    String correo = _correoController.text;
    String direccion = _direccionController.text;
    String telefono = _telefonoController.text;

    // Actualizar el cliente con los nuevos valores
    Cliente clienteModificado = widget.cliente.copyWith(
      nombre: nombre,
      correo: correo,
      direccion: direccion,
      telefono: telefono,
    );

    // Llamar al método para actualizar el cliente en el servicio
    ClientService().actualizarCliente(clienteModificado).then((_) {
      // Si se actualiza correctamente, cerrar la página y volver a la anterior
      Navigator.pop(context);
    }).catchError((error) {
      // Si hay un error, mostrar un mensaje
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar los cambios: $error')),
      );
    });
  }

  void _eliminarCliente() {
    // Llamar al método para eliminar el cliente en el servicio
    ClientService().eliminarCliente(widget.cliente.correo).then((_) {
      // Si se elimina correctamente, cerrar la página y volver a la anterior
      Navigator.pop(context);
    }).catchError((error) {
      // Si hay un error, mostrar un mensaje
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar el cliente: $error')),
      );
    });
  }
}
