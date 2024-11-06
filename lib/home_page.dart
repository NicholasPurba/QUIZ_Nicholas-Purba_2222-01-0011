import 'package:flutter/material.dart';
import 'menu_button.dart';
import 'request_appointments_page.dart';
import 'my_appointments_page.dart';
import 'treatment_info_page.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dental-It'),
        backgroundColor: Colors.blue[800],
        actions: [
          // Hamburger (three-line) icon
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // You can handle the menu actions here
              print("Hamburger menu tapped");
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // Allow scrolling for the whole page
        child: Column(
          children: [
            const SizedBox(height: 16.0),

            // Logo and text at the top
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Wrapping image in SingleChildScrollView for scrolling
                  Image.network('data:image/png;base64,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'), // Placeholder for the logo
                  const SizedBox(height: 8.0),
                  const Text(
                    'Medisys Innovation \n Innovation • Domain • Technology',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),

            // Divider to separate the logo and description from the menu
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
              indent: 16.0, // Add space from the left
              endIndent: 16.0, // Add space from the right
            ),

            // Menu buttons grid
            GridView.count(
              shrinkWrap: true, // Ensures it takes only as much space as needed
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(), // Prevents grid from being scrollable, as the main content is scrollable
              children: [
                MenuButton(
                  icon: Icons.add_circle_outline,
                  label: 'Request Appointments',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RequestAppointmentsPage()),
                    );
                  },
                ),
                MenuButton(
                  icon: Icons.assignment_outlined,
                  label: 'My Appointments',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyAppointmentsPage()),
                    );
                  },
                ),
                MenuButton(
                  icon: Icons.info_outline,
                  label: 'Treatment Info',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TreatmentInfoPage()),
                    );
                  },
                ),
                MenuButton(
                  icon: Icons.search,
                  label: 'Search',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
