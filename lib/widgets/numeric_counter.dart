import 'package:flutter/material.dart';

// Widget personalizado: control de volumen con botones + y -.
// Es StatefulWidget porque el valor cambia cuando el usuario toca los botones.
class NumericCounter extends StatefulWidget {
  const NumericCounter({super.key});

  @override
  State<NumericCounter> createState() => _NumericCounterState();
}

class _NumericCounterState extends State<NumericCounter> {
  // Variable de tipo int que guarda el volumen actual
  int _volume = 5;

  // Límites del volumen
  final int _minVolume = 0;
  final int _maxVolume = 10;

  // Se ejecuta al pulsar el botón "+"
  void _increase() {
    setState(() {
      if (_volume < _maxVolume) {
        _volume = _volume + 1;
      }
    });
  }

  // Se ejecuta al pulsar el botón "-"
  void _decrease() {
    setState(() {
      if (_volume > _minVolume) {
        _volume = _volume - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color.fromARGB(255, 28, 18, 45), width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Control de volumen',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Icono que cambia si el volumen está en 0
          Icon(
            _volume == 0 ? Icons.volume_off : Icons.volume_up,
            size: 60,
            color: const Color.fromARGB(255, 28, 18, 45),
          ),
          const SizedBox(height: 10),

          // Valor actual de la variable
          Text(
            '$_volume',
            style: const TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 28, 18, 45),
            ),
          ),
          const SizedBox(height: 10),

          // Barra que muestra el volumen de forma visual
          LinearProgressIndicator(
            value: _volume / _maxVolume,
            minHeight: 12,
            color: const Color.fromARGB(255, 28, 18, 45),
            backgroundColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 10),

          // Mensaje cuando se llega a un límite
          Text(
            _volume == _maxVolume
                ? 'Volumen máximo'
                : _volume == _minVolume
                    ? 'Silencio'
                    : 'Volumen: $_volume de $_maxVolume',
            style: TextStyle(color: Colors.grey.shade700),
          ),
          const SizedBox(height: 20),

          // Botones para disminuir y aumentar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: _decrease,
                icon: const Icon(Icons.remove),
                label: const Text('Bajar'),
              ),
              ElevatedButton.icon(
                onPressed: _increase,
                icon: const Icon(Icons.add),
                label: const Text('Subir'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}