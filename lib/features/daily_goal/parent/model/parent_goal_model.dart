class GoalModel {
  final String name;
  final double progress; // 0.0 - 1.0
  final int coinsPerDay;
  final String status;

  GoalModel({
    required this.name,
    required this.progress,
    required this.coinsPerDay,
    required this.status,
  });
}
