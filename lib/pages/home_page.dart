import 'package:flutter/material.dart';
import 'package:order_it/model/Cliente.dart';
import 'package:order_it/services/ClientService.dart';
import '../services/firebase_service.dart';
import 'agregarClientePage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseService firebaseService = FirebaseService();
  late List<Cliente> listaClientes = [];

  @override
  void initState() {
    super.initState();
    cargarClientes();
  }

  void cargarClientes() async {
    List<Cliente> clientes = await ClientService().cargarClientes();
    setState(() {
      listaClientes = clientes;
    });
  }

   void abrirInterfazAgregarCliente() {
    // Navegar a la página para agregar un nuevo cliente
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AgregarClientePage()),
    ).then((value) {
      // Actualizar la lista de clientes si se agrega uno nuevo
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                onPressed: () => abrirInterfazAgregarCliente(),
                icon: const Icon(Icons.add_circle_outline_sharp),
              )

                ],

              ),
              
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: listaClientes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(listaClientes[index].nombre, style: const TextStyle( fontSize: 28 ),),
                      subtitle: Text(
                          '${listaClientes[index].correo} - ${listaClientes[index].telefono}'),
                      // Puedes agregar más detalles aquí según tus necesidades
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
