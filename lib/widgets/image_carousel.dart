import 'package:flutter/material.dart';

// Carrusel horizontal de tarjetas (playlists recomendadas).
class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    // SizedBox fija la altura del carrusel.
    // ListView con scrollDirection horizontal permite deslizar hacia los lados.
    return SizedBox(
      height: 170,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: const [
          CarouselCard(
            title: 'Rock Clásico',
            imagePath: 'assets/images/rock.jpg',
          ),
          CarouselCard(
            title: 'Pop Hits',
            imagePath: 'assets/images/pop_hits.jpg',
          ),
          CarouselCard(
            title: 'Relax',
            imagePath: 'assets/images/relax.jpg',
          ),
          CarouselCard(
            title: 'Electrónica',
            imagePath: 'assets/images/electronica.jpg',
          ),
        ],
      ),
    );
  }
}

// Tarjeta individual del carrusel, reutilizable con parámetros.
class CarouselCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const CarouselCard({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      // La Column apila: primero la imagen y debajo el título
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Imagen con bordes redondeados.
          // Expanded hace que la imagen ocupe todo el espacio que sobra
          // después de colocar el título.
          Expanded(
            child: Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. Espacio entre la imagen y el título
          const SizedBox(height: 8),

          // 3. Título fuera de la imagen, abajo
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}