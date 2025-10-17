/// Modelo de datos para representar un día del Carnaval con información esencial.
/// Incluye el título del día, la fecha y una lista de actividades en formato simple.
class CarnavalDay {
  /// Título descriptivo del día (por ejemplo, "Día de Negros y Blancos")
  final String title;

  /// Fecha representativa del día (por ejemplo, "6 de enero de 2026")
  final String date;

  /// Lista de actividades principales planeadas para ese día
  final List<String> activities;

  /// Constructor constante que requiere inicializar todos los campos obligatorios
  const CarnavalDay({
    required this.title,
    required this.date,
    required this.activities,
  });
}
