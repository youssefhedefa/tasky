class TaskEntity{
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String priority;
  final String status;
  final String dueDate;

  TaskEntity({required this.id, required this.title, required this.description, required this.imageUrl, required this.priority, required this.status, required this.dueDate});
}