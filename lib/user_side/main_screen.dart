import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_side/profile_page.dart';
import 'package:flutter_application_1/user_side/scan_page.dart';
// change

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D614E),
      body: SafeArea(
        child: Column(
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // User Profile
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Color(0xFF2D614E)),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'ABCD',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'abcd@gmail.com',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            'Chyasal -09, Lalitpur',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Notification Icon
                  const Icon(Icons.notifications_outlined, color: Colors.white),
                ],
              ),
            ),

            // Reward Points
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.star, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          '101',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Reward Point',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type to search',
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Schedule Section
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Waste Pickup Schedule',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D614E),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        children: _buildScheduleItems(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Navigation
            // Container(
            //   padding: const EdgeInsets.symmetric(vertical: 16),
            //   color: const Color(0xFF2D614E),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: const [
            //       Icon(Icons.home, color: Colors.white),
            //       Icon(Icons.qr_code_scanner, color: Colors.white),
            //       Icon(Icons.person_outline, color: Colors.white),
            //     ],
            //   ),
            // ),
            // Bottom Navigation with QR Scan Button
Container(
  padding: const EdgeInsets.symmetric(vertical: 16),
  color: const Color(0xFF2D614E),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
        icon: const Icon(Icons.home, color: Colors.white),
        onPressed: () {
          // Add navigation for Home (if needed)
        },
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScanPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          children: const [
            Icon(Icons.qr_code_scanner, color: Color(0xFF2D614E)),
            SizedBox(width: 8),
            Text(
              "Scan QR",
              style: TextStyle(color: Color(0xFF2D614E), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      IconButton(
        icon: const Icon(Icons.person_outline, color: Colors.white),
        onPressed: () {
          // Add navigation for Profile (if needed)
          Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
        },
      ),
    ],
  ),
),

          ],
        ),
      ),
    );
  }

  List<Widget> _buildScheduleItems() {
    final scheduleData = [
      {'day': 'Sunday', 'type': 'Biodegradable Waste', 'time': '7:00AM'},
      {'day': 'Monday', 'type': 'Recyclable Waste', 'time': '10:00AM'},
      {'day': 'Tuesday', 'type': 'Non-Recyclable Waste', 'time': '8:00AM'},
      {'day': 'Wednesday', 'type': 'Biodegradable Waste', 'time': '9:00AM'},
      {'day': 'Thursday', 'type': 'Recyclable Waste', 'time': '8:00AM'},
      {'day': 'Friday', 'type': 'Non-Recyclable Waste', 'time': '7:00AM'},
      {'day': 'Saturday', 'type': 'Biodegradable Waste', 'time': '7:00AM'},
    ];

    return scheduleData.map((schedule) {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF2D614E)),
              ),
              child: Text(
                schedule['day']!,
                style: const TextStyle(
                  color: Color(0xFF2D614E),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF2D614E),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      schedule['type']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      schedule['time']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}