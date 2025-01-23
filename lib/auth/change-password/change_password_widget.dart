import 'package:flutter/material.dart';

class ChangePasswordWidget extends StatelessWidget {
  final bool processing;
  final Function(String newPassword, String code) onChangePassword;

  const ChangePasswordWidget({
    super.key,
    required this.processing,
    required this.onChangePassword,
  });

  @override
  Widget build(BuildContext context) {
    // Controllers for the TextFields
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController codeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding for spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Change Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: newPasswordController,
              obscureText: true, // Hide text for password
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: codeController,
              decoration: InputDecoration(
                labelText: 'Code',
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
                        String newPassword = newPasswordController.text;
                        String code = codeController.text;
                        onChangePassword(newPassword, code);
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
                    : Text('CHange Password'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
