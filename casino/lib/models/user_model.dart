class User {
  final String name;
  final String email;
  double balance;
  int level;
  int experience;

  User({
    required this.name,
    required this.email,
    this.balance = 1000.0,
    this.level = 1,
    this.experience = 0,
  });

  void addBalance(double amount) {
    balance += amount;
  }

  void subtractBalance(double amount) {
    balance -= amount;
  }

  void addExperience(int exp) {
    experience += exp;
    if (experience >= level * 100) {
      level++;
      experience = 0;
    }
  }
}