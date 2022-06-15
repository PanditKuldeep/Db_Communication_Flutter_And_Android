import 'package:floor/floor.dart';

@Entity(tableName: 'students')
class Student {
  @primaryKey
  final int id;
  final String name;
  final int grade;

  Student(this.id, this.name, this.grade);
}
