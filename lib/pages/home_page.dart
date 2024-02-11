import 'package:flutter/material.dart';
import 'package:order_it/model/Cliente.dart';
import 'package:order_it/services/ClientService.dart';
import 'agregarClientePage.dart';
import 'modificarClientePage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Cliente> _listaClientes = [];

  @override
  void initState() {
    super.initState();
    cargarClientes();
  }

  void cargarClientes() async {
    List<Cliente> clientes = await ClientService().cargarClientes();
    setState(() {
      _listaClientes = clientes;
    });
  }

  void _abrirInterfazAgregarCliente() {
    // Navegar a la página para agregar un nuevo cliente
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AgregarClientePage()),
    ).then((value) {
      // Actualizar la lista de clientes si se agrega uno nuevo
      if (value == true) {
        cargarClientes();
      }
    });
  }

  void _abrirModificarCliente(Cliente cliente) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ModificarClientePage(cliente: cliente),
      ),
    ).then((value) {
      // Actualizar la lista de clientes si se realizan cambios
      if (value == true) {
        cargarClientes();
      }
    });
  }

  // SIGN USER OUT METHOD
  void signUserOut() {
    // Implementa el método para cerrar sesión del usuario si es necesario
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  "Lista de Clientes",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 80),
                IconButton(
                  onPressed: () => _abrirInterfazAgregarCliente(),
                  icon: const Icon(Icons.add_circle_outline_sharp),
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _listaClientes.length,
                itemBuilder: (context, index) {
                  Cliente cliente = _listaClientes[index];
                  return GestureDetector(
                    onTap: () {
                      _abrirModificarCliente(cliente);
                    },
                    child: ListTile(
                      title: Text(cliente.nombre),
                      subtitle: Text(cliente.correo),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
