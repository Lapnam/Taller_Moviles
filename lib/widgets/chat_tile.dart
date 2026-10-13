import 'package:flutter/material.dart';

// Widget personalizado: representa una conversación de la lista de chats.
// Recibe por parámetros los datos que cambian en cada conversación.
class ChatTile extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final IconData avatarIcon;
  final Color avatarColor;
  final int unreadCount; // 0 significa que no hay mensajes sin leer

  const ChatTile({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarIcon,
    required this.avatarColor,
    required this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          // 1. Avatar del contacto
          CircleAvatar(
            radius: 26,
            backgroundColor: avatarColor,
            child: Icon(avatarIcon, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 14),

          // 2. Nombre y último mensaje (ocupan el espacio libre)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // 3. Hora e indicador de mensajes sin leer
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              const SizedBox(height: 6),
              // Si hay mensajes sin leer, muestra un círculo con el número.
              // Si no hay, muestra un espacio vacío.
              unreadCount > 0
                  ? Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$unreadCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : const SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }
}