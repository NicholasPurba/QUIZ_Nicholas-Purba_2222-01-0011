import 'package:flutter/material.dart';

class MyAppointmentsPage extends StatelessWidget {
  final List<Map<String, String>> appointments = [
    {'date': '2024-11-06', 'time': '10:00 AM', 'status': 'Confirmed'},
    {'date': '2024-11-07', 'time': '2:00 PM', 'status': 'Pending'},
    {'date': '2024-11-08', 'time': '1:00 PM', 'status': 'Cancelled'},
  ];

  MyAppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            final appointment = appointments[index];

            // Define status color based on appointment status
            Color statusColor;
            IconData statusIcon;
            switch (appointment['status']) {
              case 'Confirmed':
                statusColor = Colors.green;
                statusIcon = Icons.check_circle_outline;
                break;
              case 'Pending':
                statusColor = Colors.orange;
                statusIcon = Icons.access_time;
                break;
              case 'Cancelled':
                statusColor = Colors.red;
                statusIcon = Icons.cancel_outlined;
                break;
              default:
                statusColor = Colors.grey;
                statusIcon = Icons.info_outline;
            }

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: Icon(
                  statusIcon,
                  size: 40.0,
                  color: statusColor,
                ),
                title: Text(
                  'Date: ${appointment['date']}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                subtitle: Text(
                  'Time: ${appointment['time']}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue[600],
                  ),
                ),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    appointment['status'] ?? 'Unknown',
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Details for ${appointment['date']}')),
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
