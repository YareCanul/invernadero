import 'package:flutter/material.dart';
import 'package:invernadero/navbar.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  Map<String, String> _selectedOptions = {};

  Color _getButtonColor(String option) {
    switch (option) {
      case 'Completado':
        return Colors.green;
      case 'Pospuesto':
        return Colors.blue;
      case 'Cancelado':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  void _showOptionsDialog(BuildContext context, String optionKey) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecciona una opción'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOptionDialogItem('Completado', optionKey),
              _buildOptionDialogItem('Pospuesto', optionKey),
              _buildOptionDialogItem('Cancelado', optionKey),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionDialogItem(String option, String optionKey) {
    Color optionColor = _getButtonColor(option);
    return ListTile(
      title: Text(
        option,
        style: TextStyle(color: optionColor),
      ),
      onTap: () {
        Navigator.of(context).pop();
        setState(() {
          _selectedOptions[optionKey] = option;
        });
      },
      tileColor: optionColor.withOpacity(0.1),
      selectedTileColor: optionColor.withOpacity(0.3),
    );
  }

  Widget _buildOptionItem(String name, IconData icon, String optionKey) {
    String? selectedOption = _selectedOptions.containsKey(optionKey) ? _selectedOptions[optionKey] : '';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedOption!.isNotEmpty ? _getButtonColor(selectedOption) : Colors.transparent,
              border: Border.all(color: Colors.blue, width: 1.5),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              name,
              style: TextStyle(fontSize: 14),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showOptionsDialog(context, optionKey);
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                selectedOption.isNotEmpty ? _getButtonColor(selectedOption) : Colors.blue,
              ),
            ),
            child: Text(
              selectedOption.isNotEmpty ? selectedOption : 'Seleccionar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewReminderButton(String optionKey) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(width: 30),
          Icon(Icons.add_circle_outline, size: 20),
          SizedBox(width: 8),
          TextButton(
            onPressed: () {
              _showOptionsDialog(context, optionKey);
            },
            child: Text(
              'Agregar nuevo',
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

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
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hola, Yare',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.wb_sunny,
                          size: 18,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '25°C',
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              'Soleado',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Bienvenido a tu invernadero',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Container(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recordatorios',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.opacity,
                                  size: 18,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Riego',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            _buildOptionItem('Maiz', Icons.circle, 'riego_maiz'),
                            _buildOptionItem('Cilantro', Icons.circle, 'riego_cilantro'),
                            _buildOptionItem('Rabano', Icons.circle, 'riego_rabano'),
                            _buildNewReminderButton('riego'),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.eco,
                                  size: 18,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Fertilización',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            _buildOptionItem('Sandia', Icons.circle, 'fertilizacion_sandia'),
                            _buildOptionItem('Cilantro', Icons.circle, 'fertilizacion_cilantro'),
                            _buildOptionItem('Rabano', Icons.circle, 'fertilizacion_rabano'),
                            _buildNewReminderButton('fertilizacion'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MyNavBar(),
    );
  }
}
