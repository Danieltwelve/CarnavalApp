import 'package:flutter/material.dart';
import '../../../../widgets/map_widget.dart';

class DayDetailPage extends StatelessWidget {
  final String dayName;
  final String date;
  final List<String> activities;
  final double latitude;
  final double longitude;

  const DayDetailPage({
    super.key,
    required this.dayName,
    required this.date,
    required this.activities,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dayName),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$dayName - $date',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Actividades principales:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ...activities.map((activity) => Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.celebration_rounded,
                      color: Colors.deepPurpleAccent,
                    ),
                    title: Text(activity),
                  ),
                )),
            const SizedBox(height: 24),
            const Text(
              'Ubicación en el mapa:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            // Mapa con la ubicación del evento
            MapWidget(latitude: latitude, longitude: longitude),
          ],
        ),
      ),
    );
  }
}
