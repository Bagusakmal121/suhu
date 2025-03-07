import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double _inputValue = 0.0;
  double _convertedValue = 0.0;
  String _selectedUnit = 'Celsius to Fahrenheit';
  final TextEditingController _controller = TextEditingController();

  void _convertTemperature() {
    setState(() {
      double input = double.tryParse(_controller.text) ?? 0.0;
      switch (_selectedUnit) {
        case 'Celsius to Fahrenheit':
          _convertedValue = (input * 9 / 5) + 32;
          break;
        case 'Fahrenheit to Celsius':
          _convertedValue = (input - 32) * 5 / 9;
          break;
        case 'Celsius to Kelvin':
          _convertedValue = input + 273.15;
          break;
        case 'Kelvin to Celsius':
          _convertedValue = input - 273.15;
          break;
        case 'Celsius to Reaumur':
          _convertedValue = input * 4 / 5;
          break;
        case 'Reaumur to Celsius':
          _convertedValue = input * 5 / 4;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konversi Suhu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Suhu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              value: _selectedUnit,
              items: const [
                DropdownMenuItem(value: 'Celsius to Fahrenheit', child: Text('Celsius ke Fahrenheit')),
                DropdownMenuItem(value: 'Fahrenheit to Celsius', child: Text('Fahrenheit ke Celsius')),
                DropdownMenuItem(value: 'Celsius to Kelvin', child: Text('Celsius ke Kelvin')),
                DropdownMenuItem(value: 'Kelvin to Celsius', child: Text('Kelvin ke Celsius')),
                DropdownMenuItem(value: 'Celsius to Reaumur', child: Text('Celsius ke Reaumur')),
                DropdownMenuItem(value: 'Reaumur to Celsius', child: Text('Reaumur ke Celsius')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedUnit = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: const Text('Konversi'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Hasil: $_convertedValue',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
