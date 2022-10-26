// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  final String description;
  final String date;
  final String id;
  bool? isDone;
  bool? isFavorite;
  bool? isDeleted;

  Task({
    required this.title,
    required this.description,
    required this.date,
    required this.id,
    this.isDone,
    this.isFavorite,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isFavorite = isFavorite ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
    String? title,
    String? description,
    String? date,
    String? id,
    bool? isDone,
    bool? isFavorite,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isFavorite: isFavorite ?? this.isFavorite,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'date': date,
      'id': id,
      'isDone': isDone,
      'isFavorite': isFavorite,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      id: map['id'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  @override
  List<Object?> get props =>
      [title, description, date, id, isDone, isFavorite, isDeleted];
}
