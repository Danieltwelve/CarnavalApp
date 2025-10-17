import 'package:flutter/material.dart';
import '../../../../widgets/map_widget.dart';

class DayDetailPage extends StatelessWidget {
  final String title;
  final List<String> activities;
  final double latitude;
  final double longitude;

  const DayDetailPage({
    super.key,
    required this.title,
    required this.activities,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Actividades principales:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...activities.map(
              (activity) => Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: const Icon(Icons.celebration, color:Colors.deepPurple),
                  title: Text(activity),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: MapWidget(
                latitude: latitude,
                longitude: longitude,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
