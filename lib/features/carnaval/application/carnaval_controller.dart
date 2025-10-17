import '../domain/carnaval_day.dart';

/// Controlador que proporciona la lista de días del Carnaval con sus detalles.
/// Cada día contiene fecha, título, URL de imagen y lista de actividades con hora, nombre y lugar.
class CarnavalController {
  /// Retorna una lista de instancias [CarnavalDay], representando días específicos del carnaval.
  List<CarnavalDay> getDays() {
    return [
      CarnavalDay(
        date: '[translate:2 de Enero]',
        title: '[translate:Carnavalito]',
        imageUrl:
            'https://carnavaldepasto.org/wp-content/uploads/2023/01/carnavalito.jpg',
        activities: [
          {
            'time': '9:00 a.m.',
            'name': '[translate:Desfile Infantil]',
            'location': '[translate:Centro de Pasto]',
          },
          {
            'time': '2:00 p.m.',
            'name': '[translate:Presentaciones artísticas]',
            'location': '[translate:Plaza Nariño]',
          },
        ],
      ),
      CarnavalDay(
        date: '[translate:5 de Enero]',
        title: '[translate:Día de Negros]',
        imageUrl:
            'https://carnavaldepasto.org/wp-content/uploads/2023/01/dia-negros.jpg',
        activities: [
          {
            'time': '10:00 a.m.',
            'name': '[translate:Juegos tradicionales]',
            'location': '[translate:Barrio Obrero]',
          },
          {
            'time': '4:00 p.m.',
            'name': '[translate:Música y espuma]',
            'location': '[translate:Avenida Colombia]',
          },
        ],
      ),
      CarnavalDay(
        date: '[translate:6 de Enero]',
        title: '[translate:Día de Blancos]',
        imageUrl:
            'https://carnavaldepasto.org/wp-content/uploads/2023/01/desfile-magno.jpg',
        activities: [
          {
            'time': '9:00 a.m.',
            'name': '[translate:Desfile Magno]',
            'location': '[translate:Centro de Pasto]',
          },
          {
            'time': '7:00 p.m.',
            'name': '[translate:Concierto de cierre]',
            'location': '[translate:Estadio Departamental]',
          },
        ],
      ),
    ];
  }
}
