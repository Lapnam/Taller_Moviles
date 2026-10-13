import 'package:flutter/material.dart';

// Widget personalizado: banner promocional del Home.
// Recibe por parámetros el título, la descripción, la imagen y el color.
class PromotionalBanner extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Color backgroundColor;

  const PromotionalBanner({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // La Column apila: primero el título (afuera) y luego el recuadro de color
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Título fuera del recuadro
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // 2. Recuadro de color con descripción, botón e imagen
        Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Parte izquierda: descripción y botón, centrados
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Escuchar ahora'),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),

              // Parte derecha: imagen con bordes redondeados
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  // Si la imagen no carga, muestra un icono con aviso
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.white24,
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.white,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}