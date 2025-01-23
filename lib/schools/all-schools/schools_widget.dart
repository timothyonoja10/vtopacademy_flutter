
import 'package:flutter/material.dart';
import '../school.dart';

class SchoolsWidget extends StatelessWidget {
  
  const SchoolsWidget({
    super.key,
    required this.loading,
    required this.schools,
  });

  final bool loading;
  final List<School> schools;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: loading ? 
        Center(child: CircularProgressIndicator()) : 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Schools',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ],
        ),
    );
  }
}