
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../all-schools/schools_screen.dart';
import 'add_school_ui_state.dart';
import 'add_school_widget.dart';

class AddSchoolScreen extends StatelessWidget {
  const AddSchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddSchoolUiState(),
      child: AddSchool(),
    );
  }
}

class AddSchool extends StatelessWidget {
  const AddSchool({super.key});

  @override
  Widget build(BuildContext context) {
    var addSchoolUiState = context.watch<AddSchoolUiState>(); 
    bool processing = addSchoolUiState.processing;
    bool schoolAdded = addSchoolUiState.schoolAdded;

    void processAddSchoolCallback(String name, int number) {
      addSchoolUiState.processAddSchoolForm(name, number);
    }

    if (schoolAdded) {
      Future.microtask(() =>
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SchoolsScreen()),
        )
      );
    }

    return AddSchoolWidget(
      processing: processing,
      onAddSchool: processAddSchoolCallback,
    );
  }
}