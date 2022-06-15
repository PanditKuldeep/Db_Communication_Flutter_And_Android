import 'package:android_native_flutter_db/database/student_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class StudentDao {
  @Query('SELECT * FROM students')
  Future<List<Student>> findAllStudents();

  @Query('SELECT * FROM students WHERE id = :id')
  Stream<Student?> findStudentById(int id);

  @insert
  Future<void> insertStudent(List<Student> student);

  @Query('DELETE FROM students WHERE id = :id')
  Future<void> delete(int id);
}
