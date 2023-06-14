import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bmi =0.0;

  mySnackBar(message, context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  clearResult() {
    bmi = 0.0;
    setState(() {});
  }
  clearField() {
    wtController.clear();
    ftController.clear();
    inController.clear();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text("BMI Calculator"),
          centerTitle: true,
          elevation: 6,

        ),
        body: Center(
          child: Container(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your BMI : ${bmi.toStringAsFixed(2)}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),

                const SizedBox(height: 18,),

                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                      label: Text("Enter Your Weight (KG)"),
                      prefixIcon: Icon(Icons.line_weight),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(8)
                        )
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15,),

                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                      label: Text("Enter Your Height (FT)"),
                      prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(8)
                        )
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 15,),
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                      label: Text("Enter Your Height (INCH)"),
                      prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(8)
                        )
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed: (){
                      var weight = wtController.text.toString();
                      var height = ftController.text.toString();
                      var inch = inController.text.toString();

                      if(weight != "" && height != "" && inch != ""){
                        var wt = int.parse(weight);
                        var ht = int.parse(height);
                        var inc = int.parse(inch);

                        var totalHeight = (ht*12) + inc;

                        var  totalCM = totalHeight * 2.54;
                        var totalMeter = totalCM/100;

                        bmi = wt/(totalMeter*totalMeter);

                        setState(() {
                          result = "Your BMI : ${bmi.toStringAsFixed(2)}";
                        });

                        if(bmi<22){
                          mySnackBar("You are underweight!!", context);
                        }
                        else if(bmi>=22 && bmi<=27){
                          mySnackBar("You are healthy weight.", context);
                        }
                        else{
                          mySnackBar("You are in danger zone!!", context);
                        }
                      }
                      else{
                        setState(() {
                          result = "Please Fill The All Fields";
                        });

                      }

                    }, child: const Text("Check BMI")),
                    const SizedBox(width: 10,),
                    ElevatedButton(onPressed: (){clearField(); clearResult();}, child: const Icon(Icons.refresh_rounded)),
                  ],
                ),




              ],
            ),
          ),
        )

    );
  }
}
