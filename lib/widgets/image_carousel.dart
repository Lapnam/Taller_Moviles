import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

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


          const SizedBox(height: 8),


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