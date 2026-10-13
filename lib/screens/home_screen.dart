import 'package:flutter/material.dart';
import '../widgets/post_card.dart';
import '../widgets/promotional_banner.dart';
import '../widgets/image_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 10),
        const Padding(          
          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Row(
            children:[
              Text(
            'Playlists Recientes' ,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward_ios, size: 18),
          
      ],
    ),
        ),

        const ImageCarousel(),

        const SizedBox(height: 10),

        const PromotionalBanner(
          title: 'Nuevo lanzamiento',
          description: 'Gondwana - El álbum que estabas esperando.',
          imagePath: 'assets/images/gondwana.jpg',
          backgroundColor: Color.fromARGB(255, 54, 44, 69),
        ),

  
        const PostCard(
          userName: 'Garz',
          description: 'Salsita pal corazon.',
          avatarIcon: Icons.headphones,
          avatarColor: Colors.deepPurple,
          imagePath: 'assets/images/salsita.jpg',
        ),
        const PostCard(
          userName: 'Pauuu',
          description: 'Estudiar con esto? boff',
          avatarIcon: Icons.music_note,
          avatarColor: Colors.orange,
          imagePath: 'assets/images/techno.jpg',
        ),
      ],
    );
  }
}