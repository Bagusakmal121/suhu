import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TemperatureProvider(),
      child: const MyApp(),
    ),
  );
}

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

class TemperatureConverter extends StatelessWidget {
  const TemperatureConverter({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TemperatureProvider>(context);

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
            // Card Input
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: provider.controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Suhu',
                        prefixIcon: const Icon(Icons.thermostat, color: Colors.blue),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      value: provider.selectedUnit,
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
                        if (value != null) {
                          provider.setSelectedUnit(value);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol Konversi
            GestureDetector(
              onTap: provider.convert,
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

            // Card Hasil
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
                      provider.convertedValue.toStringAsFixed(2),
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
