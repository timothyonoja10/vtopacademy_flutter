import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  final bool processing;
  final Function(String username, String password) onLogin;

  const LoginWidget({
    super.key,
    required this.processing,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    // Controllers for the TextFields
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding for spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
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
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true, // Hide text for password
              decoration: InputDecoration(
                labelText: 'Password',
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
                        String username = usernameController.text;
                        String password = passwordController.text;
                        onLogin(username, password);
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
