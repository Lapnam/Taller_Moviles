import 'package:flutter/material.dart';

// Widget personalizado que representa una publicación tipo red social.
// Es StatefulWidget porque el botón "Me gusta" cambia de estado.
class PostCard extends StatefulWidget {
  // Parámetros: la información que cambia en cada publicación
  final String userName;
  final String description;
  final IconData avatarIcon;
  final Color avatarColor;
  final String imagePath; // Ruta de la imagen principal

  const PostCard({
    super.key,
    required this.userName,
    required this.description,
    required this.avatarIcon,
    required this.avatarColor,
    required this.imagePath,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  // Variable que guarda si el usuario ya dio "Me gusta"
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      // clipBehavior recorta la imagen para respetar los bordes redondeados
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Encabezado: avatar + nombre de usuario
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: widget.avatarColor,
                  child: Icon(widget.avatarIcon, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Text(
                  widget.userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // 2. Imagen principal
          Image.asset(
            widget.imagePath,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            // Si la imagen no carga, muestra un icono de aviso
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: const Icon(Icons.broken_image, size: 60),
              );
            },
          ),

          // 3. Botones: "Me gusta" y comentarios
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    _liked ? Icons.favorite : Icons.favorite_border,
                    color: _liked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _liked = !_liked;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.comment_outlined),
                  onPressed: () {},
                ),
                Text(_liked ? 'Te gusta' : 'Me gusta'),
              ],
            ),
          ),

          // 4. Descripción breve
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(widget.description),
          ),
        ],
      ),
    );
  }
}