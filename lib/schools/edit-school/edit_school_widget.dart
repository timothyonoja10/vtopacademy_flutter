
import 'package:flutter/material.dart';
import '../school.dart';

class EditSchoolWidget extends StatelessWidget {
  final bool processing;
  final School school;
  final Function(String name, int number) onEditSchool;

  const EditSchoolWidget({
    super.key,
    required this.processing,
    required this.school,
    required this.onEditSchool,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(text: school.name);
    final TextEditingController numberController = TextEditingController(text: school.number.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit School'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit School',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number, 
              decoration: InputDecoration(
                labelText: 'Number', 
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: processing
                    ? null // Disable the button if processing is true
                    : () {
                        // Read values from controllers when button is pressed
                        String name = nameController.text;
                        String numberText = numberController.text;

                        // Parse number input
                        int? number = int.tryParse(numberText);
                        if (number == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please enter a valid number')),
                          );
                          return;
                        }

                        // Call the callback function
                        onEditSchool(name, number);
                      },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12), // Button padding
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: processing
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text('Edit School'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 