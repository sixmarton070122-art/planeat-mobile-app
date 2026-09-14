import 'package:flutter/material.dart';

class AppTheme {
  static const Color seedColor = Color(0xFF2E7D32); // a rich green

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'AlteHaasGrotesk',
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 195, 247, 198),
          brightness: Brightness.light,
        ).copyWith(
          surface: const Color.fromARGB(
            255,
            120,
            245,
            130,
          ), // light green — this is what your containers actually read
          inversePrimary: const Color.fromARGB(255, 27, 149, 33),
        ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 66, 199, 71),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2E7D32),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 60, 156, 64),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      color: const Color(
        0xFFE8F5E9,
      ), // kept in sync with colorScheme.surface above
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color.fromARGB(255, 203, 253, 203),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    sliderTheme: SliderThemeData(
      overlayShape: SliderComponentShape
          .noOverlay, // match dark theme, or use 0 to disable
      thumbColor: const Color.fromARGB(255, 38, 160, 44),
      activeTrackColor: const Color.fromARGB(255, 38, 160, 44),
      inactiveTrackColor: const Color(0xFFB2DFB5),
      overlayColor: const Color(0x332E7D32),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: const WidgetStatePropertyAll(
          TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),

        // Selected segment background
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const Color.fromARGB(255, 65, 193, 69);
          }
          return const Color.fromARGB(255, 176, 253, 180);
        }),

        // Selected/unselected text color
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return null;
        }),
      ),
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'AlteHaasGrotesk',
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        ).copyWith(
          surface: const Color.fromARGB(255, 0, 70, 0),
          inversePrimary: const Color.fromARGB(255, 1, 116, 1),
        ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 50, 0),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1B3A1E),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF66BB6A),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 1,
      color: const Color(0xFF1B2A1B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color.fromARGB(255, 24, 102, 24),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    sliderTheme: SliderThemeData(
      inactiveTrackColor: Color(0xFF2E7D32),
      activeTrackColor: Color.fromARGB(255, 171, 245, 173),
      thumbColor: Color.fromARGB(255, 171, 245, 173),
      overlayColor: Color(0x332E7D32),
      overlayShape: SliderComponentShape.noOverlay,
    ),

    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: const WidgetStatePropertyAll(
          TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        // Selected segment background
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const Color.fromARGB(255, 29, 105, 33);
          }
          return const Color.fromARGB(255, 13, 59, 15);
        }),

        // Selected/unselected text color
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return null;
        }),
      ),
    ),
  );
}
