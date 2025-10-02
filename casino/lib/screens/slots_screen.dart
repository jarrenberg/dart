import 'package:flutter/material.dart';
import '../models/game_model.dart';
import '../models/user_model.dart';

class SlotsScreen extends StatefulWidget {
  final Game game;

  const SlotsScreen({required this.game});

  @override
  _SlotsScreenState createState() => _SlotsScreenState();
}

class _SlotsScreenState extends State<SlotsScreen> {
  final List<String> symbols = ['🍒', '🍋', '🍊', '🍇', '🔔', '💎'];
  List<String> reels = ['🍒', '🍒', '🍒'];
  double betAmount = 10.0;
  bool isSpinning = false;
  User user = User(name: "Jugador", email: "jugador@casino.com");

  void _spin() {
    if (isSpinning || user.balance < betAmount) return;

    setState(() {
      isSpinning = true;
      user.subtractBalance(betAmount);
    });

    // Simular giro
    int spins = 0;
    const totalSpins = 20;
    
    void spinStep() {
      if (spins < totalSpins) {
        setState(() {
          reels = List.generate(3, (index) => symbols[(DateTime.now().millisecondsSinceEpoch + index + spins) % symbols.length]);
        });
        spins++;
        Future.delayed(Duration(milliseconds: 100), spinStep);
      } else {
        _checkWin();
      }
    }
    
    spinStep();
  }

  void _checkWin() {
    setState(() {
      isSpinning = false;
      
      // Lógica simple de ganancia
      if (reels[0] == reels[1] && reels[1] == reels[2]) {
        double winAmount = betAmount * 5;
        user.addBalance(winAmount);
        _showWinDialog(winAmount);
      } else if (reels[0] == reels[1] || reels[1] == reels[2]) {
        double winAmount = betAmount * 2;
        user.addBalance(winAmount);
        _showWinDialog(winAmount);
      }
    });
  }

  void _showWinDialog(double amount) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('¡Felicidades!'),
        content: Text('Ganaste \$${amount.toStringAsFixed(2)}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

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
            // Display de los carretes
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: reels.map((symbol) => Text(
                  symbol,
                  style: TextStyle(fontSize: 50),
                )).toList(),
              ),
            ),
            
            SizedBox(height: 30),
            
            // Control de apuesta
            Text('Apuesta: \$${betAmount.toStringAsFixed(2)}'),
            Slider(
              min: widget.game.minBet,
              max: widget.game.maxBet,
              value: betAmount,
              onChanged: isSpinning ? null : (value) {
                setState(() => betAmount = value);
              },
            ),
            
            SizedBox(height: 20),
            
            // Botón de girar
            ElevatedButton(
              onPressed: isSpinning ? null : _spin,
              child: Text(isSpinning ? 'Girando...' : 'GIRAR'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}