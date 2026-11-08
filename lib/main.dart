import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RGB Color Picker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ColorPickerScreen(),
    );
  }
}

class ColorPickerScreen extends StatelessWidget {
  const ColorPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Кастомний віджет контейнера попереднього перегляду
            ColorPreviewContainer(),
            SizedBox(height: 40),
            // Кастомний віджет секції зі слайдерами
            ColorSlidersSection(),
          ],
        ),
      ),
    );
  }
}

// 1. Кастомний віджет для кольорового контейнера
class ColorPreviewContainer extends StatelessWidget {
  const ColorPreviewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorModel>(
      builder: (context, colorModel, child) {
        return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: colorModel.currentColor,
            border: Border.all(color: Colors.grey.shade400),
          ),
        );
      },
    );
  }
}

// 2. Кастомний віджет для секції зі слайдерами
class ColorSlidersSection extends StatelessWidget {
  const ColorSlidersSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Використовуємо Provider для отримання доступу до методів моделі
    final colorModel = Provider.of<ColorModel>(context);

    return Column(
      children: [
        _buildSliderRow(
          label: 'Red: ${colorModel.red.toInt()}',
          value: colorModel.red,
          onChanged: (val) => colorModel.setRed(val),
        ),
        const SizedBox(height: 16),
        _buildSliderRow(
          label: 'Green: ${colorModel.green.toInt()}',
          value: colorModel.green,
          onChanged: (val) => colorModel.setGreen(val),
        ),
        const SizedBox(height: 16),
        _buildSliderRow(
          label: 'Blue: ${colorModel.blue.toInt()}',
          value: colorModel.blue,
          onChanged: (val) => colorModel.setBlue(val),
        ),
      ],
    );
  }

  Widget _buildSliderRow({
    required String label,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        Slider(
          value: value,
          min: 0,
          max: 255,
          onChanged: onChanged,
        ),
      ],
    );
  }
}