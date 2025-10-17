import 'package:flutter/material.dart';
import '../../../../widgets/map_widget.dart';

/// Pantalla que muestra el detalle completo de un día específico del Carnaval,
/// incluyendo nombre, fecha, actividades principales y ubicación geográfica en un mapa.
class DayDetailPage extends StatelessWidget {
  /// Nombre o título representativo del día (por ejemplo, 'Día de Negros y Blancos')
  final String dayName;

  /// Fecha específica del día (por ejemplo, '6 de enero de 2026')
  final String date;

  /// Lista de actividades principales que se desarrollan ese día
  final List<String> activities;

  /// Latitud para centrar el mapa en la ubicación del evento
  final double latitude;

  /// Longitud para centrar el mapa en la ubicación del evento
  final double longitude;

  /// Constructor constante que exige todos los campos obligatorios
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
      // AppBar con nombre del día y estilo distintivo
      appBar: AppBar(
        title: Text(dayName),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      // Cuerpo con scroll vertical que contiene el detalle completo
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título compuesto por nombre y fecha en fuente grande y negrita
            Text(
              '$dayName - $date',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Subtítulo para la sección de actividades principales
            const Text(
              'Actividades principales:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            // Listado dinámico de actividades en tarjetas estilizadas
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
            // Subtítulo para la sección de mapa
            const Text(
              'Ubicación en el mapa:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            // Mapa que muestra la ubicación según latitud y longitud
            MapWidget(latitude: latitude, longitude: longitude),
          ],
        ),
      ),
    );
  }
}
