import 'package:flutter/material.dart';
import '../widgets/chat_tile.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ListView permite desplazar la lista de chats verticalmente
    return ListView(
      children: const [
        ChatTile(
          name: 'lapnam',
          lastMessage: 'Playlist para dictar clases',
          time: 'Lunes',
          avatarIcon: Icons.library_music,
          avatarColor: Colors.indigo,
          unreadCount: 0,
        ),
        ChatTile(
          name: 'Garz',
          lastMessage: 'Mi canción favorita es "Este amor que se muere"',
          time: '10:45 a. m.',
          avatarIcon: Icons.headphones,
          avatarColor: Colors.deepPurple,
          unreadCount: 3,
        ),
        ChatTile(
          name: 'Pauuu',
          lastMessage: 'Tardeo de Punchis Punchis',
          time: '9:30 a. m.',
          avatarIcon: Icons.music_note,
          avatarColor: Colors.orange,
          unreadCount: 1,
        ),
        ChatTile(
          name: 'Mariin',
          lastMessage: 'Solo R&B en esta monda',
          time: 'Ayer',
          avatarIcon: Icons.graphic_eq,
          avatarColor: Colors.pink,
          unreadCount: 0,
        ),
        ChatTile(
          name: 'Zeta',
          lastMessage: 'Entrenamos con esta playlist?',
          time: 'Ayer',
          avatarIcon: Icons.mic,
          avatarColor: Colors.teal,
          unreadCount: 5,
        ),
        
      ],
    );
  }
}