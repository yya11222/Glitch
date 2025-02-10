import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_application_1/user_side/main_screen.dart';
import 'package:hive/hive.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _locationController = TextEditingController();
  final _emailController = TextEditingController();
  final Box usersBox = Hive.box('usersBox');  // Open user storage

  void registerUser() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Check if user already exists
    if (usersBox.containsKey(username)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Username already exists!")),
      );
      return;
    }

    // Save user in Hive
    usersBox.put(username, UserModel(username: username, password: password));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("User registered successfully!")),
    );

    // Navigate to Login Screen (Optional)
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 4),
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2D614E),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Header
              Container(
                padding: const EdgeInsets.only(bottom: 40),
                decoration: const BoxDecoration(
                  color: Color(0xFF2D614E),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    "Let's\nCreate\nYour\nAccount",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Form fields
              _buildTextField(
                controller: _usernameController,
                hint: "Full Name",
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _locationController,
                hint: "Your Location",
                icon: Icons.location_on_outlined,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _emailController,
                hint: "Email Address",
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _passwordController,
                hint: "Password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _passwordController,
                hint: "Retype Password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 24),

              // Terms checkbox
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _termsAccepted,
                      onChanged: (value) {
                        setState(() {
                          _termsAccepted = value ?? false;
                        });
                      },
                      activeColor: const Color(0xFF2D614E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "I agree to the ",
                    style: TextStyle(color: Colors.black54),
                  ),
                  const Text(
                    "Terms & Privacy",
                    style: TextStyle(
                      color: Color(0xFF2D614E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Sign Up button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _termsAccepted ? () {
                    Navigator.push(   // Navigate to HomePage
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D614E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Sign In link
              Center(
                child: RichText(
                  text: const TextSpan(
                    text: "Have an account? ",
                    style: TextStyle(color: Colors.black54),
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          color: Color(0xFF2D614E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required controller,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black54),
        prefixIcon: Icon(icon, color: const Color(0xFF2D614E)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xFF2D614E)),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
      ),
    );
  }
}