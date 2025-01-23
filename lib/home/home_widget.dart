
import 'package:flutter/material.dart';
import '../auth/forgot-password/forgot_password_screen.dart';
import '../auth/login/login_screen.dart';
import '../auth/register/register_screen.dart';

class HomeWidget extends StatelessWidget {
  
  const HomeWidget({
    super.key,
    required this.loading,
    required this.loggedIn,
  });

  final bool loading;
  final bool loggedIn;

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
                'Home Page',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            ListTile(
              title: Text('Schools'),
              onTap: () {
                Navigator.pushNamed(context, '/schools/all-schools');
              },
            ),
            if (!loggedIn) ...[
              ListTile(
                title: Text('Register'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Login'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Forgot Password'),
                onTap: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgotPassword()),
                  );
                },
              ),
            ],
            if (loggedIn)
              ListTile(
                title: Text('Logout'),
                onTap: () {
                  Navigator.pushNamed(context, '/auth/logout');
                },
              ),
          ],
        ),
    );
  }
}