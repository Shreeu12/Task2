import 'package:flutter/material.dart';
import 'product_details_page.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    String username = '';
    String password = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.green], // Adjust gradient colors as needed
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Card(
            elevation: 5,
            child: Container(
              height: 300, // Adjust the height as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.grey], // Adjust card gradient colors as needed
                ),
              ),
              padding: EdgeInsets.all(20), // Adjust padding as needed
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        username = value!;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value!;
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (value) {
                            _isChecked = value ?? false;
                          },
                        ),
                        Text('Agree to terms'),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save(); // Save form data
                          // Perform login logic (e.g., validate credentials)
                          // For demonstration, navigate to product details page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(),
                            ),
                          );
                        }
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
