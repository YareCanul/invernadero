import 'package:flutter/material.dart';
import 'package:invernadero/ConexionMqtt.dart';

import 'navbar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 154, 240, 161),
              Color.fromARGB(255, 169, 230, 179),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.0),
            CircleAvatar(
              radius: 64.0,
              backgroundImage: AssetImage('assets/img/inverna.png'), // Reemplaza con la ruta de tu imagen de perfil
            ),
            SizedBox(height: 16.0),
            Text(
              'Nombre de Usuario',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'correo@example.com',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            SizedBox(height: 24.0),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.black),
              title: Text('Teléfono', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              onTap: () {
                // Acción al presionar la opción de teléfono
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.black),
              title: Text('Configuración', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              onTap: () {
                 Navigator.of(context).pushReplacement(
                     MaterialPageRoute(builder: (BuildContext context) => ConexionMqtt()),
              );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.black),
              title: Text('Cerrar sesión', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              onTap: () {
                // Acción al presionar la opción de cerrar sesión
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyNavBar(),
    );
  }
}
