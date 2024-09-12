import 'package:flutter/material.dart';
import 'widgets/registerPromotion.dart';
import 'models/promotions.dart';
import 'package:intl/intl.dart'; // Asegúrate de tener intl en pubspec.yaml

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Promociones | ima',
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
        dialogTheme: const DialogTheme(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(20),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.black,
            padding: const EdgeInsets.all(20),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Promotion> promotions = [
    Promotion(
      code: 'ABC123',
      name: 'Descuento Verano',
      client: 'Cliente A',
      expirationDate: DateTime.now().add(Duration(days: 30)),
    ),
    Promotion(
      code: 'XYZ789',
      name: 'Promoción Invierno',
      client: 'Cliente B',
      expirationDate: DateTime.now().add(Duration(days: 60)),
    ),
    // Agrega más promociones aquí
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Promociones'),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const registerPromotion(),
                );
              },
              child: const Text('Registrar'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Código')),
                    DataColumn(label: Text('Nombre de la Promoción')),
                    DataColumn(label: Text('Cliente')),
                    DataColumn(label: Text('Fecha de Vigencia')),
                    DataColumn(label: Text('Acciones')), // Columna de acciones
                  ],
                  rows: promotions.map((promotion) {
                    return DataRow(cells: [
                      DataCell(Text(promotion.code)),
                      DataCell(Text(promotion.name)),
                      DataCell(Text(promotion.client)),
                      DataCell(Text(DateFormat('yyyy-MM-dd').format(promotion.expirationDate))),
                      DataCell(Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => {},
                          ),
                        ],
                      )),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}