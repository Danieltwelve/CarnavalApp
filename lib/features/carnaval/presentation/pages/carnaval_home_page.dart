import 'package:flutter/material.dart';
import 'day_detail_page.dart';

/// Pantalla principal que muestra un listado de los días principales del Carnaval 2026.
/// Cada día contiene un título, actividades planificadas y coordenadas geográficas.
/// Al seleccionar un día, navega a la pantalla de detalle correspondiente (DayDetailPage).
class CarnavalHomePage extends StatelessWidget {
  /// Constructor vacío requerido para StatelessWidget
  const CarnavalHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de mapas que representan los días del carnaval con sus datos
    final days = [
      {
        'title': 'Pre-Carnaval (28 al 31 de diciembre de 2025)',
        'activities': [
          '28 dic: Conciertos, Arco iris en el asfalto, carreras atleticas',
          '29 dic: Desfile de Colonias',
          '30 dic: Serenata a Pasto',
          '31 dic: Desfile de Años Viejos'
        ],
        'lat': 1.2136,
        'lng': -77.2811,
      },
      {
        'title': 'Carnaval (2 al 8 de enero de 2026)',
        'activities': [
          '2 ene: Carnavalito',
          '3 ene: Desfile de Colectivos Coreográficos',
          '4 ene: Familia Castañeda',
          '5 ene: Día de Negros',
          '6 ene: Día de Blancos (Gran desfile magno)',
          '7-8 ene: Actividades culturales y cierre'
        ],
        'lat': 1.2147,
        'lng': -77.2805,
      },
      {
        'title': 'Día de Negros y Blancos (6 de enero de 2026)',
        'activities': [
          'Desfile Magno de carrozas',
          'Batalla de espuma y talco',
          'Eventos musicales en la Plaza del Carnaval',
          'Coronación a la mejor carrozas'
        ],
        'lat': 1.2150,
        'lng': -77.2810,
      },
    ];

    return Scaffold(
      // Barra superior con el título principal y color personalizado
      appBar: AppBar(
        title: const Text('Fechas principales del Carnaval 2026'),
        backgroundColor: Colors.deepPurple,
      ),
      // ListView dinámico que muestra cada día como una tarjeta interactiva
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: days.length,
        itemBuilder: (context, index) {
          final day = days[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            // ListTile que muestra el título y permite navegar a la página de detalle
            child: ListTile(
              title: Text(
                day['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navegación a DayDetailPage pasando datos del día seleccionado
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DayDetailPage(
                      title: day['title'] as String,
                      activities: List<String>.from(day['activities'] as List),
                      latitude: day['lat'] as double,
                      longitude: day['lng'] as double,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
