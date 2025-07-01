import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sensor para Prueba de Proyecto',
      home: MovimientoSensores(title: 'Movimiento con Giroscopio'),
    );
  }
}

class MovimientoSensores extends StatefulWidget {
  final String title;

  const MovimientoSensores({super.key, required this.title});

  @override
  State<MovimientoSensores> createState() => _MovimientoSensoresState();
}

class _MovimientoSensoresState extends State<MovimientoSensores> {
  double dx = 100;
  double dy = 100;

  @override
  void initState() {
    super.initState();
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        dx += event.y * 5; 
        dy += event.x * 5;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Stack(
        children: [
          Positioned(
            left: dx,
            top: dy,
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
