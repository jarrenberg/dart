class Game {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final double minBet;
  final double maxBet;
  final GameType type;

  Game({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.minBet,
    required this.maxBet,
    required this.type,
  });
}

enum GameType {
  SLOTS,
  BLACKJACK,
  ROULETTE,
  POKER,
}