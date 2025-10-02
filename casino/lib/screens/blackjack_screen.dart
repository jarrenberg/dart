import 'package:flutter/material.dart';
import '../models/game_model.dart';
import '../models/user_model.dart';

class BlackjackScreen extends StatefulWidget {
  final Game game;
  
  const BlackjackScreen({super.key, required this.game});

  @override
  State<BlackjackScreen> createState() => _BlackjackScreenState();
}

class _BlackjackScreenState extends State<BlackjackScreen> {
  User user = User(name: "Jugador", email: "jugador@casino.com");
  double betAmount = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.game.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Blackjack - Próximamente',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Este juego estará disponible en la próxima actualización'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}