// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:order_it/model/Cliente.dart';
import 'package:http/http.dart' as http;

class ClientService extends ChangeNotifier {
  final String _urlClients =
      "https://orderit-67872-default-rtdb.europe-west1.firebasedatabase.app/Clientes.json";

  final List<Cliente> _listaClientes = [];

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
}
