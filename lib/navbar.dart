import 'package:flutter/material.dart';
import 'package:invernadero/home.dart';
import 'package:invernadero/perfil.dart';
import 'package:invernadero/principal.dart';

class MyNavBar extends StatefulWidget {
  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegar a la pantalla correspondiente según el índice seleccionado
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => Principal()),
        );
        break;
      case 1:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
        );
        break;
      case 2:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),  // Color de fondo de la barra de navegación (verde)
      selectedItemColor: Colors.blue,  // Color del ícono seleccionado (azul)
      unselectedItemColor: Colors.black,  // Color de los íconos no seleccionados (negro)
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black),
          label: 'Principal',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_florist, color: Colors.black),
          label: 'Plantas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color:  Colors.black),
          label: 'Perfil',
        ),
      ],
    );
  }
}
