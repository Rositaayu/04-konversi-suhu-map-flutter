import 'package:flutter/material.dart';
import 'package:flutter_map/widgets/dropdown.dart';
import 'package:flutter_map/widgets/input.dart';
import 'package:flutter_map/widgets/konversi.dart';
import 'package:flutter_map/widgets/result.dart';
import 'package:flutter_map/widgets/history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final inputController = TextEditingController();

  double _inputUser = 0;
  String _selectedDropdown = "Kelvin";
  double _result = 0;

  List listHasil = [];
  var listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit", "Celcius"];

  onChangedDropdown(newValue) {
    setState(() {
      _selectedDropdown = newValue;
      perhitunganSuhu();
    });
  }

  perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_selectedDropdown == "Kelvin") {
        _result = _inputUser + 273;
        listHasil.add('Kelvin : $_result');
      } else if (_selectedDropdown == "Reamur") {
        _result = (4 / 5) * _inputUser;
        listHasil.add('Reamur : $_result');
      } else if (_selectedDropdown == "Fahrenheit") {
        _result = (9 / 5) * _inputUser + 32;
        listHasil.add('Fahrenheit : $_result');
      } else {
        _result = _inputUser;
        listHasil.add('Celcius : $_result');
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Konversi Suhu',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Konversi Suhu"),
          ),
          body: Container(
            padding: const EdgeInsets.only(top: 30),
            child: Column(children: [
              const Text('Rosita Ayu Tri Lestari - 2031710152',),
              Input(inputController: inputController),
              const SizedBox(
                height: 10,
              ),
              Dropdown(
                  listItem: listSatuanSuhu,
                  selectedDropdown: _selectedDropdown,
                  onDropdownChange: onChangedDropdown),
              Result(result: _result),
              Konversi(konvertHandler: perhitunganSuhu),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              const Text(
                '\nRiwayat Konversi\n',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Expanded(child: History(listHasil: listHasil))
            ]),
          ),
        ));
  }
}
