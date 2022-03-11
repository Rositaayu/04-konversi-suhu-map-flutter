import 'package:flutter/material.dart';
import 'package:flutter_map/widgets/dropdown.dart';
import 'package:flutter_map/widgets/input.dart';
import 'package:flutter_map/widgets/konversi.dart';
import 'package:flutter_map/widgets/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _result = 0;
  String _selectedDropdown = "Pilih Suhu";
  final _listSatuanSuhu = ["kelvin", "reamur"];
  final List<String> _listHasil = [];
  TextEditingController etInput = TextEditingController();

  _onChangedDropdown(String value) {
    setState(() {
      _selectedDropdown = value;
    });
  }

  _convertHandler() {
    setState(() {
      if (etInput.text.isNotEmpty) {
        _inputUser = double.parse(etInput.text);
        switch (_selectedDropdown) {
          case "kelvin":
            _result = _inputUser + 273;
            _listHasil.add("Konversi dari: $_inputUser ke $_result  kelvin");
            break;
          case "reamur":
            _result = _inputUser * 4 / 5;
            _listHasil.add("Konversi dari: $_inputUser ke $_result  reamur");
            break;
          default:
            _listHasil.add("Suhu belum dipilih");
            break;
        }
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu Rositaayu - 2031710152',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu Rositaayu - 2031710152"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(etInput: etInput),
              Dropdown(
                  selectedDropdown: _selectedDropdown,
                  listSatuanSuhu: _listSatuanSuhu,
                  onChangedDropdown: _onChangedDropdown),
              Konversi(convertHandler: _convertHandler),
              Result(listHasil: _listHasil),
            ],
          ),
        ),
      ),
    );
  }
}
