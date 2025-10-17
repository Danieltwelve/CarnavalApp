import '../domain/carnaval_day.dart';

class CarnavalController {
  List<CarnavalDay> getDays() {
    return [
      CarnavalDay(
        date: '2 de Enero',
        title: 'Carnavalito',
        imageUrl: 'https://carnavaldepasto.org/wp-content/uploads/2023/01/carnavalito.jpg',
        activities: [
          {
            'time': '9:00 a.m.',
            'name': 'Desfile Infantil',
            'location': 'Centro de Pasto',
          },
          {
            'time': '2:00 p.m.',
            'name': 'Presentaciones artísticas',
            'location': 'Plaza Nariño',
          },
        ],
      ),
      CarnavalDay(
        date: '5 de Enero',
        title: 'Día de Negros',
        imageUrl: 'https://carnavaldepasto.org/wp-content/uploads/2023/01/dia-negros.jpg',
        activities: [
          {
            'time': '10:00 a.m.',
            'name': 'Juegos tradicionales',
            'location': 'Barrio Obrero',
          },
          {
            'time': '4:00 p.m.',
            'name': 'Música y espuma',
            'location': 'Avenida Colombia',
          },
        ],
      ),
      CarnavalDay(
        date: '6 de Enero',
        title: 'Día de Blancos',
        imageUrl: 'https://carnavaldepasto.org/wp-content/uploads/2023/01/desfile-magno.jpg',
        activities: [
          {
            'time': '9:00 a.m.',
            'name': 'Desfile Magno',
            'location': 'Centro de Pasto',
          },
          {
            'time': '7:00 p.m.',
            'name': 'Concierto de cierre',
            'location': 'Estadio Departamental',
          },
        ],
      ),
    ];
  }
}
