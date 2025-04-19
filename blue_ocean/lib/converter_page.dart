import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});
  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final TextEditingController _celsiustem = TextEditingController();
  final TextEditingController _kelvintem = TextEditingController();

  String _kelvin = " ";
  String _celsius = "";

  void convertCToK() {
    double? celsius = double.tryParse(_celsiustem.text);
    if (celsius != null) {
      double kelvin = (celsius + 273.15);
      setState(() {
        _kelvin = "${kelvin.toStringAsFixed(2)} °K";
      });
    } else {
      setState(() {
        _kelvin = "Please enter a valid Celsius input.";
      });
    }
  }

  void convertKToC() {
    double? kelvin = double.tryParse(_kelvintem.text);
    if (kelvin != null) {
      double celsius = (kelvin - 273.15);
      setState(() {
        _celsius = "${celsius.toStringAsFixed(2)} °C";
      });
    } else {
      setState(() {
        _celsius = "Please enter a valid Kelvin input.";
      });
    }
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Temperature Converter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 5,
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _celsiustem,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Temperature in Celsius',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: convertCToK,
              child: Text('Convert to Kelvin'),
            ),
            SizedBox(height: 10),
            Text(
              _kelvin,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            Divider(height: 40),

            TextField(
              controller: _kelvintem,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Temperature in Kelvin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: convertKToC,
              child: Text('Convert to Celsius'),
            ),
            SizedBox(height: 10),
            Text(
              _celsius,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
