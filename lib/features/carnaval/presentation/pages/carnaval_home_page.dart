import 'package:flutter/material.dart';
import 'day_detail_page.dart';
import '../../../../core/theme/carnaval_colors.dart';

/// Pantalla principal mejorada del Carnaval de Negros y Blancos 2026
/// Diseño moderno con gradientes, cards atractivas y animaciones
class CarnavalHomePage extends StatelessWidget {
  const CarnavalHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de los días principales del carnaval con información detallada
    final days = [
      {
        'title': 'Pre-Carnaval',
        'subtitle': '28-31 Diciembre 2025',
        'icon': Icons.music_note_rounded,
        'gradient': const LinearGradient(
          colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        'activities': [
          '🎵 28 dic: Conciertos y Arco iris en el asfalto',
          '🚶‍♂️ 29 dic: Desfile de Colonias',
          '🎶 30 dic: Serenata a Pasto',
          '🎭 31 dic: Desfile de Años Viejos'
        ],
        'lat': 1.2136,
        'lng': -77.2811,
      },
      {
        'title': 'Día de Negros',
        'subtitle': '5 de Enero 2026',
        'icon': Icons.dark_mode_rounded,
        'gradient': CarnavalColors.gradientNegros,
        'activities': [
          '🎨 Pintura corporal con cosmético negro',
          '💃 Desfiles y comparsas por las calles',
          '🎵 Música y danzas tradicionales',
          '🎉 Celebración de la cultura afrodescendiente'
        ],
        'lat': 1.2147,
        'lng': -77.2805,
      },
      {
        'title': 'Día de Blancos',
        'subtitle': '6 de Enero 2026',
        'icon': Icons.wb_sunny_rounded,
        'gradient': const LinearGradient(
          colors: [Color(0xFFFFC107), Color(0xFFFF9800), Color(0xFFFF5722)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        'activities': [
          '🎪 Gran Desfile Magno de carrozas',
          '💨 Batalla de espuma y talco blanco',
          '🎵 Eventos musicales en la Plaza del Carnaval',
          '👑 Coronación a la mejor carroza'
        ],
        'lat': 1.2150,
        'lng': -77.2810,
      },
      {
        'title': 'Semana del Carnaval',
        'subtitle': '2-8 de Enero 2026',
        'icon': Icons.celebration_rounded,
        'gradient': CarnavalColors.gradientFiesta,
        'activities': [
          '👶 2 ene: Carnavalito',
          '💃 3 ene: Desfile de Colectivos Coreográficos',
          '👨‍👩‍👧‍👦 4 ene: Familia Castañeda',
          '🎨 7-8 ene: Actividades culturales y cierre'
        ],
        'lat': 1.2144,
        'lng': -77.2808,
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF5F5F5),
              Color(0xFFE8EAF6),
              Color(0xFFF3E5F5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            // AppBar estilo Sliver con gradiente
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Carnaval 2026',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black45,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: CarnavalColors.gradientPrincipal,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.festival,
                      size: 80,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            ),

            // Header con información
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.white, Color(0xFFF8BBD0)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: CarnavalColors.morado,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.info_outline_rounded,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Patrimonio de la Humanidad',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: CarnavalColors.textDark,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'UNESCO • San Juan de Pasto, Colombia',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: CarnavalColors.textLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Fechas Principales',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CarnavalColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Explora los eventos más importantes',
                      style: TextStyle(
                        fontSize: 14,
                        color: CarnavalColors.textLight,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Lista de días del carnaval
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final day = days[index];
                    return _buildDayCard(context, day, index);
                  },
                  childCount: days.length,
                ),
              ),
            ),

            // Footer con espacio adicional
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }

  /// Construye una tarjeta individual para cada día del carnaval
  Widget _buildDayCard(BuildContext context, Map<String, dynamic> day, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 6,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
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
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              gradient: day['gradient'] as LinearGradient,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header del card con ícono y título
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          day['icon'] as IconData,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              day['title'] as String,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              day['subtitle'] as String,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white.withOpacity(0.8),
                        size: 20,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  
                  // Preview de actividades
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.event_note_rounded,
                              color: Colors.white.withOpacity(0.9),
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${(day['activities'] as List).length} actividades',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          (day['activities'] as List).first,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.95),
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
