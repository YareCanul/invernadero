import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invernadero/navbar.dart';
import 'package:invernadero/sensorsScreen.dart';
import 'package:invernadero/sistemaRiego.dart';

import 'luces.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 154, 240, 161),
              Color.fromARGB(255, 169, 230, 179),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              Text(
                'Mis Actividades',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TemperatureContainer(),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ActivityContainer(
                        icon: Icons.lightbulb,
                        label: 'Luces',
                        onTap: () {
                          // Navegar a la pantalla de luces
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LucesScreen(),
                            ),
                          );
                        },
                        iconColor: Colors.green, // Cambio del color del icono
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: BlindsContainer(),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: FanContainer(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ActivityContainer(
                        icon: Icons.water_damage,
                        label: 'Sistema de Riego',
                        onTap: () {
                          // Navegar a la pantalla de sistema de riego
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => sistemaRiego(),
                            ),
                          );
                        },
                        iconColor: Colors.green, // Cambio del color del icono
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 2,
                      child: ActivityContainer(
                        icon: Icons.sensors,
                        label: 'Sensores',
                        onTap: () {
                          // Navegar a la pantalla de sensores
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SensorsScreen(),
                            ),
                          );
                        },
                        iconColor: Colors.green, // Cambio del color del icono
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyNavBar(),
    );
  }
}

class TemperatureContainer extends StatefulWidget {
  @override
  _TemperatureContainerState createState() => _TemperatureContainerState();
}

class _TemperatureContainerState extends State<TemperatureContainer> {
  double temperature = 25.0;

  void increaseTemperature() {
    setState(() {
      temperature += 1.0;
    });
  }

  void decreaseTemperature() {
    setState(() {
      temperature -= 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Temperatura',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.remove,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 18,
                ),
                onPressed: () => decreaseTemperature(),
              ),
              Text(
                '${temperature.toStringAsFixed(1)}°C',
                style: TextStyle(fontSize: 12.5),
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 18,
                ),
                onPressed: () => increaseTemperature(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BlindsContainer extends StatefulWidget {
  @override
  _BlindsContainerState createState() => _BlindsContainerState();
}

class _BlindsContainerState extends State<BlindsContainer> {
  bool areBlindsOpen = false;

  void toggleBlinds() {
    setState(() {
      areBlindsOpen = !areBlindsOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => toggleBlinds(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: areBlindsOpen ? Colors.green : Colors.grey,
              ),
              child: Icon(
                areBlindsOpen ? Icons.window : Icons.window_sharp,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Persianas',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2),
          ElevatedButton(
            onPressed: () => toggleBlinds(),
            child: Text(areBlindsOpen ? 'Cerrar' : 'Abrir'),
          ),
        ],
      ),
    );
  }
}

class ActivityContainer extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color iconColor; // Nueva propiedad para el color del icono

  const ActivityContainer({
    required this.icon,
    required this.label,
    this.onTap,
    required this.iconColor, // Actualización de los parámetros
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: iconColor, // Usar el nuevo color del icono
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class FanContainer extends StatefulWidget {
  @override
  _FanContainerState createState() => _FanContainerState();
}

class _FanContainerState extends State<FanContainer> {
  bool isFanOn = false;

  void toggleFan() {
    setState(() {
      isFanOn = !isFanOn;
    });
  }
Color fanIconColor = Colors.green; // Variable para controlar el color del icono

@override
Widget build(BuildContext context) {
  return Container(
    width: 150,
    height: 150,
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 3,
          blurRadius: 2,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          child: Icon(
            Icons.ac_unit,
            size: 50,
            color: fanIconColor, // Utiliza la variable de color
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Ventilador',
          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          width: 60,
          height: 32,
          child: CupertinoSwitch(
            value: isFanOn,
            onChanged: (value) {
              setState(() {
                toggleFan();
                fanIconColor = isFanOn ? Colors.green : Colors.grey; // Actualiza el color del icono
              });
            },
            activeColor: Colors.green,
            trackColor: Colors.grey,
          ),
        ),
      ],
    ),
  );
}

}
