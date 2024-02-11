// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:order_it/model/Cliente.dart';
import 'package:http/http.dart' as http;

class ClientService extends ChangeNotifier {
  final String _urlClients =
      "https://orderit-67872-default-rtdb.europe-west1.firebasedatabase.app/Clientes.json";

  final List<Cliente> _listaClientes = [];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Cliente>> cargarClientes() async {
    try {
      final resp = await http.get(Uri.parse(_urlClients));

      final List<dynamic> clientsList = json.decode(resp.body);
      //print(clientsList);

      for (var value in clientsList) {
        final tempClient = Cliente.fromMap(value);
        _listaClientes.add(tempClient);
      }

      //print(_listaClientes);

      if (resp.statusCode == 200) {
        // Manejar la lógica adicional si es necesario
      } else {
        print("Error en la solicitud HTTP: ${resp.statusCode}");
      }
    } catch (error) {
      print("Error durante la solicitud HTTP: $error");
    }
    return _listaClientes;
  }

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

      print('Cliente actualizado en Firebase con correo: ${cliente.correo}');
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



}
