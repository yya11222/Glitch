import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.green),
            onPressed: () {
              // Save profile logic here
            },
          ),
        ],
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Image
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://placeholder.com/150x150',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.verified,
                        size: 20,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Form Fields
            _buildFormField(
              label: 'Name',
              value: 'Charlotte King',
              icon: null,
            ),
            _buildFormField(
              label: 'E mail address',
              value: '@johnkinggraphics.gmail.com',
              icon: null,
            ),
            _buildFormField(
              label: 'User name',
              value: '@johnkinggraphics',
              icon: null,
            ),
            _buildFormField(
              label: 'Password',
              value: '••••••••••',
              icon: Icons.visibility_off,
              isPassword: true,
            ),
            _buildFormField(
              label: 'Phone number',
              value: '+91 6895312',
              icon: null,
            ),

            const SizedBox(height: 24),

            // Bottom Navigation
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.home_outlined),
                  Icon(Icons.refresh),
                  Icon(Icons.person_outline),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required String value,
    IconData? icon,
    bool isPassword = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: value,
            obscureText: isPassword,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              border: const UnderlineInputBorder(),
              suffixIcon: icon != null
                  ? Icon(icon, color: Colors.black54)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}