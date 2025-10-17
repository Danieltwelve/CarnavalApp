import 'package:flutter/material.dart';

class MapWidget extends StatelessWidget {
  final double latitude;
  final double longitude;

  const MapWidget({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map, size: 48, color: Colors.grey[700]),
            const SizedBox(height: 8),
            Text('Mapa temporal', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Lat: $latitude, Lng: $longitude'),
            const SizedBox(height: 8),
            Text('Mapa interactivo.'),
          ],
        ),
      ),
    );
  }
}