
import '../../db_helper.dart';
import '../school.dart';

final DBHelper _dbHelper = DBHelper.instance;

Future<List<School>> getAllSchoolsFromDb() async {
  final result = await _dbHelper.getAll('schools');
  return result.map((map) => School.fromMap(map)).toList();
}

// Delete all schools and insert the new list of schools
Future<void> updateAllSchoolsInDb(List<School> schools) async {
  // Delete all schools
  await _dbHelper.deleteAll('schools');

  // Insert new schools
  for (var school in schools) {
    await _dbHelper.insert('schools', school.toMap());
  }
}
