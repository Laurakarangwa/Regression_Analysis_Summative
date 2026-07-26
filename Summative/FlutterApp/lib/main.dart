import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insurance Prediction',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PredictionPage(),
    );
  }
}

class PredictionPage extends StatefulWidget {
  const PredictionPage({super.key});

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {

  final age = TextEditingController();
  final bmi = TextEditingController();
  final children = TextEditingController();
  final sex = TextEditingController();
  final smoker = TextEditingController();
  final northwest = TextEditingController();
  final southeast = TextEditingController();
  final southwest = TextEditingController();

  String result = "";

  final String apiUrl =
      "https://insurance-prediction-api-eqjo.onrender.com/predict";


  Future<void> predict() async {

    try {

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "age": int.parse(age.text),
          "bmi": double.parse(bmi.text),
          "children": int.parse(children.text),
          "sex_male": int.parse(sex.text),
          "smoker_yes": int.parse(smoker.text),
          "region_northwest": int.parse(northwest.text),
          "region_southeast": int.parse(southeast.text),
          "region_southwest": int.parse(southwest.text),
        }),
      );


      if(response.statusCode == 200){

        final data = jsonDecode(response.body);

        setState(() {
          result =
          "Predicted Insurance Charge: ${data["Predicted Insurance Charge"]}";
        });

      } else {

        setState(() {
          result = "Error: ${response.body}";
        });

      }

    } catch(e){

      setState(() {
        result = "Invalid input. Please check your values.";
      });

    }

  }


  Widget input(TextEditingController controller, String label){

    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(
        title: const Text("Medical Insurance Prediction"),
      ),

      body: SingleChildScrollView(

        child: Column(
          children: [

            input(age, "Age"),
            input(bmi, "BMI"),
            input(children, "Children"),

            input(sex, "Sex Male (0/1)"),
            input(smoker, "Smoker Yes (0/1)"),

            input(northwest, "Region Northwest (0/1)"),
            input(southeast, "Region Southeast (0/1)"),
            input(southwest, "Region Southwest (0/1)"),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: predict,
              child: const Text("Predict"),
            ),

            const SizedBox(height: 20),

            Text(
              result,
              style: const TextStyle(
                fontSize: 18,
              ),
            )

          ],
        ),
      ),
    );
  }
}