
class TaskModel {
  final String title;
  final String category;
  final dynamic date;
  final dynamic hour;
  final String annotation;

  TaskModel(
      {required this.title,
      required this.category,
      required this.date,
      required this.hour,
      required this.annotation});

  TaskModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        category = json['category'],
        date = json['date'],
        hour = json['hour'],
        annotation = json['annotation'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'category': category,
        'date': date,
        'hour': hour,
        'annotation': annotation,
      };
}
