/// Modelo de datos que representa un día del Carnaval con detalles específicos.
/// Contiene la fecha, título, URL de una imagen representativa y una lista de actividades.
class CarnavalDay {
  /// Fecha del día del Carnaval (por ejemplo, '6 de enero de 2026')
  final String date;

  /// Título o nombre del día (por ejemplo, 'Día de Negros y Blancos')
  final String title;

  /// URL de una imagen representativa para mostrar en la interfaz
  final String imageUrl;

  /// Lista de actividades asociadas a este día,
  /// cada actividad representada como un mapa con clave-valor para flexibilidad.
  final List<Map<String, dynamic>> activities;

  /// Constructor requerido que obliga a inicializar todos los campos
  CarnavalDay({
    required this.date,
    required this.title,
    required this.imageUrl,
    required this.activities,
  });
}
