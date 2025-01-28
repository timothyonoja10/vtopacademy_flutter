
import 'package:flutter/material.dart';
import '../add-school/add_school_screen.dart';
import '../delete-school/delete_school_screen.dart';
import '../edit-school/edit_school_screen.dart';
import '../school.dart';

class SchoolsWidget extends StatelessWidget {
  const SchoolsWidget({
    super.key,
    required this.loading,
    required this.schools,
    required this.isAdmin,
  });

  final bool loading;
  final bool isAdmin;
  final List<School> schools;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schools'),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Schools',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: schools.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(schools[index].name),
                        trailing: isAdmin
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => 
                                          EditSchoolScreen(school: schools[index])),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => 
                                          DeleteSchoolScreen(schoolId: schools[index].schoolId)),
                                      );
                                    },
                                  ),
                                ],
                              )
                            : null,
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: isAdmin
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddSchoolScreen()),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
