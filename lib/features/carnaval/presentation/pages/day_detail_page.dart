import 'package:flutter/material.dart';
import '../../../../widgets/map_widget.dart';

/// Pantalla que muestra los detalles de un día específico, incluyendo
/// un listado de actividades principales y una ubicación geográfica en un mapa.
class DayDetailPage extends StatelessWidget {
  /// Título que aparecerá en la barra superior de la pantalla
  final String title;

  /// Lista de actividades principales del día, que se mostrarán en forma de tarjetas
  final List<String> activities;

  /// Latitud para la ubicación que se muestra en el mapa
  final double latitude;

  /// Longitud para la ubicación que se muestra en el mapa
  final double longitude;

  /// Constructor requerido para crear una instancia de DayDetailPage
  /// Recibe el título, la lista de actividades y las coordenadas (latitud y longitud).
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
      // Barra superior con el título del día y color de fondo personalizado
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple,
      ),
      // Cuerpo de la pantalla con scroll para permitir contenido extensible
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Texto que indica el inicio de la lista de actividades
            const Text(
              'Actividades principales:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // Mapeo de cada actividad creando una tarjeta con ícono y texto
            ...activities.map(
              (activity) => Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading:
                      const Icon(Icons.celebration, color: Colors.deepPurple),
                  title: Text(activity),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Contenedor fijo para el mapa mostrando ubicación con latitud y longitud
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
