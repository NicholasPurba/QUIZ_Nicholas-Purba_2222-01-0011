import 'package:flutter/material.dart';

class TreatmentInfoPage extends StatelessWidget {
  final List<Map<String, String>> treatments = [
    {'name': 'Teeth Cleaning', 'description': 'Pembersihan rutin untuk menghilangkan plak dan karang gigi.'},
    {'name': 'Tooth Extraction', 'description': 'Pencabutan gigi yang busuk atau rusak.'},
    {'name': 'Filling', 'description': 'Mengisi gigi berlubang dan memulihkan gigi yang rusak.'},
    {'name': 'Root Canal', 'description': 'Perawatan pulpa gigi yang terinfeksi.'},
  ];

  TreatmentInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treatment Info'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: treatments.length,
          itemBuilder: (context, index) {
            final treatment = treatments[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: Icon(
                  Icons.health_and_safety,
                  size: 40.0,
                  color: Colors.blue[800],
                ),
                title: Text(
                  treatment['name'] ?? 'Unknown Treatment',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                subtitle: Text(
                  treatment['description'] ?? 'No description available.',
                  style: TextStyle(
                    color: Colors.blue[600],
                  ),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('More information about ${treatment['name']}')),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
