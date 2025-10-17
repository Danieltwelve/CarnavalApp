import 'package:flutter/material.dart';
import '../../../../widgets/map_widget.dart';
import '../../../../core/theme/carnaval_colors.dart';

/// Pantalla de detalle mejorada que muestra información completa de un día del carnaval
/// con diseño moderno, cards atractivas y mejor organización visual
class DayDetailPage extends StatelessWidget {
  final String title;
  final List<String> activities;
  final double latitude;
  final double longitude;

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
      body: CustomScrollView(
        slivers: [
          // AppBar con gradiente y diseño mejorado
          SliverAppBar(
            expandedHeight: 180,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 8.0,
                      color: Colors.black45,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: _getGradientForTitle(title),
                ),
                child: Center(
                  child: Icon(
                    _getIconForTitle(title),
                    size: 70,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),

          // Contenido principal
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFAFAFA),
                    Color(0xFFF5F5F5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Card de información general
                    _buildInfoCard(context),
                    
                    const SizedBox(height: 24),
                    
                    // Sección de actividades
                    _buildActivitiesSection(),
                    
                    const SizedBox(height: 24),
                    
                    // Sección del mapa
                    _buildMapSection(),
                    
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Card con información general del evento
  Widget _buildInfoCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              _getAccentColorForTitle(title).withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _getAccentColorForTitle(title),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: _getAccentColorForTitle(title).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                _getIconForTitle(title),
                color: Colors.white,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Evento Especial',
                    style: TextStyle(
                      fontSize: 14,
                      color: CarnavalColors.textLight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CarnavalColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: CarnavalColors.textLight,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'San Juan de Pasto',
                        style: TextStyle(
                          fontSize: 12,
                          color: CarnavalColors.textLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Sección de actividades con diseño mejorado
  Widget _buildActivitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: CarnavalColors.morado.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.event_note_rounded,
                color: CarnavalColors.morado,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Actividades Principales',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CarnavalColors.textDark,
                  ),
                ),
                Text(
                  'Disfruta de cada momento',
                  style: TextStyle(
                    fontSize: 13,
                    color: CarnavalColors.textLight,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...activities.asMap().entries.map((entry) {
          final index = entry.key;
          final activity = entry.value;
          return _buildActivityCard(activity, index);
        }),
      ],
    );
  }

  /// Card individual de actividad
  Widget _buildActivityCard(String activity, int index) {
    final colors = [
      CarnavalColors.azul,
      CarnavalColors.verde,
      CarnavalColors.naranja,
      CarnavalColors.rosa,
      CarnavalColors.morado,
    ];
    
    final color = colors[index % colors.length];

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border(
              left: BorderSide(
                color: color,
                width: 4,
              ),
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.celebration_rounded,
                color: color,
                size: 24,
              ),
            ),
            title: Text(
              activity,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: CarnavalColors.textDark,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Sección del mapa con diseño mejorado
  Widget _buildMapSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: CarnavalColors.azul.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.map_rounded,
                color: CarnavalColors.azul,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ubicación',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CarnavalColors.textDark,
                  ),
                ),
                Text(
                  'Punto de encuentro',
                  style: TextStyle(
                    fontSize: 13,
                    color: CarnavalColors.textLight,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            height: 280,
            child: MapWidget(
              latitude: latitude,
              longitude: longitude,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(
                  Icons.location_pin,
                  color: CarnavalColors.rojo,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Coordenadas GPS',
                        style: TextStyle(
                          fontSize: 12,
                          color: CarnavalColors.textLight,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${latitude.toStringAsFixed(4)}, ${longitude.toStringAsFixed(4)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: CarnavalColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Obtiene el gradiente según el título del evento
  LinearGradient _getGradientForTitle(String title) {
    if (title.toLowerCase().contains('negro')) {
      return CarnavalColors.gradientNegros;
    } else if (title.toLowerCase().contains('blanco')) {
      return const LinearGradient(
        colors: [Color(0xFFFFC107), Color(0xFFFF9800), Color(0xFFFF5722)],
      );
    } else if (title.toLowerCase().contains('pre')) {
      return const LinearGradient(
        colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
      );
    }
    return CarnavalColors.gradientFiesta;
  }

  /// Obtiene el ícono según el título
  IconData _getIconForTitle(String title) {
    if (title.toLowerCase().contains('negro')) {
      return Icons.dark_mode_rounded;
    } else if (title.toLowerCase().contains('blanco')) {
      return Icons.wb_sunny_rounded;
    } else if (title.toLowerCase().contains('pre')) {
      return Icons.music_note_rounded;
    }
    return Icons.celebration_rounded;
  }

  /// Obtiene color de acento según el título
  Color _getAccentColorForTitle(String title) {
    if (title.toLowerCase().contains('negro')) {
      return CarnavalColors.negro;
    } else if (title.toLowerCase().contains('blanco')) {
      return CarnavalColors.amarillo;
    } else if (title.toLowerCase().contains('pre')) {
      return CarnavalColors.azul;
    }
    return CarnavalColors.morado;
  }
}
