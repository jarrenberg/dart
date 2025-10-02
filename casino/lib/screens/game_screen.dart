import 'package:flutter/material.dart';
import '../models/game_model.dart';
import '../widgets/game_card.dart';
import 'slots_screen.dart';
import 'blackjack_screen.dart';

class GamesScreen extends StatelessWidget {
  final List<Game> games = [
    Game(
      id: '1',
      name: 'Tragamonedas',
      description: 'Gira y gana grandes premios',
      imagePath: 'assets/slots.png',
      minBet: 1.0,
      maxBet: 100.0,
      type: GameType.SLOTS,
    ),
    Game(
      id: '2',
      name: 'Blackjack',
      description: 'Ven al dealer con 21 puntos',
      imagePath: 'assets/blackjack.png',
      minBet: 5.0,
      maxBet: 500.0,
      type: GameType.BLACKJACK,
    ),
    Game(
      id: '3',
      name: 'Ruleta',
      description: 'Apunta a tu número de la suerte',
      imagePath: 'assets/roulette.png',
      minBet: 2.0,
      maxBet: 200.0,
      type: GameType.ROULETTE,
    ),
  ];

  void _navigateToGame(BuildContext context, Game game) {
    switch (game.type) {
      case GameType.SLOTS:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SlotsScreen(game: game)),
        );
        break;
      case GameType.BLACKJACK:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BlackjackScreen(game: game)),
        );
        break;
      default:
        // Mostrar mensaje de "próximamente"
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${game.name} disponible próximamente')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Juegos Disponibles',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: games.length,
              itemBuilder: (context, index) {
                return GameCard(
                  game: games[index],
                  onTap: () => _navigateToGame(context, games[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}