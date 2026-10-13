import 'package:flutter/material.dart';


class NumericCounter extends StatefulWidget {
  const NumericCounter({super.key});

  @override
  State<NumericCounter> createState() => _NumericCounterState();
}

class _NumericCounterState extends State<NumericCounter> {
  int _volume = 5;


  final int _minVolume = 0;
  final int _maxVolume = 10;

  void _increase() {
    setState(() {
      if (_volume < _maxVolume) {
        _volume = _volume + 1;
      }
    });
  }


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


          Icon(
            _volume == 0 ? Icons.volume_off : Icons.volume_up,
            size: 60,
            color: const Color.fromARGB(255, 28, 18, 45),
          ),
          const SizedBox(height: 10),

  
          Text(
            '$_volume',
            style: const TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 28, 18, 45),
            ),
          ),
          const SizedBox(height: 10),


          LinearProgressIndicator(
            value: _volume / _maxVolume,
            minHeight: 12,
            color: const Color.fromARGB(255, 28, 18, 45),
            backgroundColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 10),

  
          Text(
            _volume == _maxVolume
                ? 'Volumen máximo'
                : _volume == _minVolume
                    ? 'Silencio'
                    : 'Volumen: $_volume de $_maxVolume',
            style: TextStyle(color: Colors.grey.shade700),
          ),
          const SizedBox(height: 20),


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