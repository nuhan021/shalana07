class ChildGoalModel {
  final String name;
  final double progress; // 0.0 - 1.0
  final int coinsPerDay;
  final String status;
  final String goalId;

  ChildGoalModel({
    required this.name,
    required this.progress,
    required this.coinsPerDay,
    required this.status,
    required this.goalId,
  });
}
