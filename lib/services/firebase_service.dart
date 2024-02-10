// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Cliente.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para agregar un cliente a Firebase
  Future<void> agregarCliente(Cliente cliente) async {
    try {
      // Convierte el objeto Cliente a un mapa
      Map<String, dynamic> data = cliente.toMap();

      // Agrega el cliente a la colección "clientes"
      await _firestore.collection('clientes').add(data);
      print('Cliente agregado a Firebase');
    } catch (e) {
      print('Error al agregar el cliente: $e');
    }
  }

  Future<void> actualizarCliente(Cliente cliente) async {
    try {
      // Convierte el objeto Cliente a un mapa
      Map<String, dynamic> data = cliente.toMap();

      // Actualiza el documento del cliente en la colección "clientes"
      await _firestore.collection('clientes').doc(cliente.correo).update(data);

      print('Cliente actualizado en Firebase con ID: ${cliente.correo}');
    } catch (e) {
      print('Error al actualizar el cliente: $e');
    }
  }

  Future<void> eliminarCliente(String correo) async {
    try {
      // Elimina el documento del cliente de la colección "clientes"
      await _firestore.collection('clientes').doc(correo).delete();

      print('Cliente eliminado de Firebase con ID: $correo');
    } catch (e) {
      print('Error al eliminar el cliente: $e');
    }
  }

  Future<List<Cliente>> obtenerClientes() async {
    try {
      // Obtiene la colección "clientes" desde Firebase

      print( _firestore.collection('Clientes'));

      QuerySnapshot querySnapshot =
          await _firestore.collection('Clientes').get();

      print("object");
      print(querySnapshot.docs);

      // Mapea los documentos a objetos Cliente
      List<Cliente> clientes = querySnapshot.docs.map((doc) {
        return Cliente(
            nombre: doc['nombre'],
            correo: doc['correo'],
            direccion: doc['direccion'],
            telefono: doc['telefono']);
      }).toList();

      print(clientes);

      return clientes;
    } catch (e) {
      print('Error al obtener clientes: $e');
      return [];
    }
  }
}
