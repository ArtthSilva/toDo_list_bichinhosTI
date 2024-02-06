// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  final String title;
  final String category;
  final dynamic date;
  final dynamic hour;
  final String annotation;
  int completed;
 
  TaskModel(
      {
      required this.title,
      required this.category,
      required this.date,
      required this.hour,
      required this.annotation,
      required this.completed
      });

  TaskModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        category = json['category'],
        date = json['date'],
        hour = json['hour'],
        annotation = json['annotation'],
        completed = json['completed'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'category': category,
        'date': date,
        'hour': hour,
        'annotation': annotation,
        'completed': completed         
      };

  
}
