import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var Result = "";
  var bgColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade300,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                      label: Text('Enter your Weight(in kg)'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                      label: Text('Enter your Height(in feet)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                      label: Text('Enter your Height(in inch)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                      } else {
                        setState(() {
                          Result = "please fill the all require!!";
                        });
                      }
                      //BMI Calculation
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (ift * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;

                      var BMI = iwt / (tM * tM);
                      var msg = "";

                      if (BMI > 25) {
                        msg = "you are OverWeight";
                        bgColor = Colors.orange.shade200;
                      } else if (BMI < 18) {
                        msg = "you are UnderWeight!!";
                        bgColor = Colors.red.shade300;
                      } else {
                        msg = " you 're Healthly!!";
                        bgColor = Colors.green.shade300;
                      }
                      setState(() {
                        Result = " $msg\n BMI is: ${BMI.toStringAsFixed(3)}";
                      });
                    },
                    child: const Text('Calculate'),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    Result,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
