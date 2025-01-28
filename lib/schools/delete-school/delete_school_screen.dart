
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../all-schools/schools_screen.dart';
import 'delete_school_ui_state.dart';
import 'delete_school_widget.dart';

class DeleteSchoolScreen extends StatelessWidget {
  const DeleteSchoolScreen({super.key, required this.schoolId});
  final int schoolId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeleteSchoolUiState(),
      child: DeleteSchool(schoolId: schoolId),
    );
  }
}

class DeleteSchool extends StatelessWidget {
  const DeleteSchool({super.key, required this.schoolId});
  final int schoolId;

  @override
  Widget build(BuildContext context) {
    var deleteSchoolUiState = context.watch<DeleteSchoolUiState>();
    bool deleted = deleteSchoolUiState.deleted;

    // Callback function for processing registration
    void processDeleteSchoolCallback() {
      deleteSchoolUiState.processDeleteSchool(schoolId);
    }

    // Navigate to SchoolsScreen if registered is true
    if (deleted) {
      Future.microtask(() =>
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SchoolsScreen()),
        )
      );
    }

    return DeleteSchoolWidget(
      deleted: deleted,
      onDelete: processDeleteSchoolCallback,
    );
  }
}