
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../school.dart';
import 'schools_ui_state.dart';
import 'schools_widget.dart';

class SchoolsScreen extends StatelessWidget {
  const SchoolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SchoolsUiState(),
      child: Schools(),
    );
  }
}

class Schools extends StatelessWidget {
  const Schools({super.key});

  @override
  Widget build(BuildContext context) {
    var schoolsUiState = context.watch<SchoolsUiState>();
    bool loading = schoolsUiState.loading;     
    List<School> schools =  schoolsUiState.schools;  

    return SchoolsWidget(loading: loading, schools: schools);
  }
}
