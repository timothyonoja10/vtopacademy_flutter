
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../all-schools/schools_screen.dart';
import '../school.dart';
import 'edit_school_ui_state.dart';
import 'edit_school_widget.dart';

class EditSchoolScreen extends StatelessWidget {
  const EditSchoolScreen({super.key, required this.school});
  final School school;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditSchoolUiState(),
      child: EditSchool(school: school),
    );
  } 
}

class EditSchool extends StatelessWidget {
  const EditSchool({super.key, required this.school});
  final School school;

  @override
  Widget build(BuildContext context) {
    var editSchoolUiState = context.watch<EditSchoolUiState>();
    bool processing = editSchoolUiState.processing;
    bool schoolUpdated = editSchoolUiState.schoolUpdated;  

    void processSchoolUpdateCallback(String name, int number) {
      editSchoolUiState.processEditSchoolForm(school.schoolId, name, number);
    }

    // Navigate to SchoolsScreen if registered is true
    if (schoolUpdated) {
      Future.microtask(() =>
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SchoolsScreen()),
        )
      );
    }

    return EditSchoolWidget(
      school: school, processing: processing,
      onEditSchool: processSchoolUpdateCallback,
    );
  }
}
