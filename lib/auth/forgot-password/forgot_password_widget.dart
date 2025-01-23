import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final bool processing;
  final Function(String username) onSubmit;

  const ForgotPasswordWidget({
    super.key,
    required this.processing,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    // Controllers for the TextFields
    final TextEditingController usernameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding for spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: processing
                    ? null // Disable the button if processing is true
                    : () {
                        // Read values from controller when button is pressed
                        String username = usernameController.text;
                        onSubmit(username);
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
                    : Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
