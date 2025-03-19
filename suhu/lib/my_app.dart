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
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('Konversi Suhu'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Card untuk Input
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Suhu',
                        prefixIcon: const Icon(Icons.thermostat, color: Colors.blue),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      value: _selectedUnit,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
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
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol Konversi dengan efek Gradient
            GestureDetector(
              onTap: _convertTemperature,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Colors.blueAccent, Colors.lightBlue]),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Konversi",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Card untuk Hasil
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Hasil Konversi:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _convertedValue.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
