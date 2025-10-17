import 'package:flutter/material.dart';
import 'day_detail_page.dart';

class CarnavalHomePage extends StatelessWidget {
  const CarnavalHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final days = [
      {
        'title': 'Pre-Carnaval (28 al 31 de diciembre de 2025)',
        'activities': [
          '28 dic: Pregón y elección de la Reina del Carnavalito',
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
          '2 ene: Desfile de Colectivos Coreográficos',
          '3 ene: Día de la Familia Castañeda',
          '4 ene: Festival del Canto a la Tierra',
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
          'Entrega de premios a las mejores carrozas'
        ],
        'lat': 1.2150,
        'lng': -77.2810,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fechas principales del Carnaval 2026'),
        backgroundColor: Colors.deepPurple,
      ),
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
            child: ListTile(
              title: Text(
                day['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
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
