import 'package:flutter/material.dart';

class CgpaCalulator extends StatefulWidget {
  const CgpaCalulator({Key? key}) : super(key: key);

  @override
  State<CgpaCalulator> createState() => _CgpaCalulatorState();
}

class _CgpaCalulatorState extends State<CgpaCalulator> {

  mySnackBar(message, context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  var markController = TextEditingController();
  var creditController = TextEditingController();

  var marks = "";
  var credits = "";


  double CGPA = 0.0;
  double totalCredit = 0.0;

  double finalCgpa = 0.0;

  @override
  Widget build(BuildContext context) {



    cgpaCalculation(double mark, double credit){
      if(mark<=100.0 && mark>=80.0){
        CGPA += (4.00 * credit);
        totalCredit+=credit;
        setState(() {

        });
      }
      else if(mark<80.0 && mark>=75.0){
        CGPA += (3.75 * credit);
        totalCredit+=credit;
        setState(() {

        });
      }
      else if(mark<75 && mark>=70){
        CGPA += (3.50 * credit);
        totalCredit+=credit;
      }
      else if(mark<70 && mark>=65){
        CGPA += (3.25 * credit);
        totalCredit+=credit;
      }
      else if(mark<65 && mark>=60){
        CGPA += (3.00 * credit);
        totalCredit+=credit;
      }
      else if(mark<60 && mark>=55){
        CGPA += (2.75 * credit);
        totalCredit+=credit;
      }
      else if(mark<55 && mark>=50){
        CGPA += (2.50 * credit);
        totalCredit+=credit;
      }
      else if(mark<50 && mark>=45){
        CGPA += (2.25 * credit);
        totalCredit+=credit;
      }
      else if(mark<45 && mark>=40){
        CGPA += (2.00 * credit);
        totalCredit+=credit;
      }
      else if(mark<40 && mark>=0){
        CGPA += (0.0 * credit);
        totalCredit+=credit;
      }
      else{
        mySnackBar("Please Enter Valid Mark. Like as 0 to 100", context);
      }
    }

    clearResult() {
      totalCredit = 0;
      CGPA = 0;
      finalCgpa =0;
      setState(() {});
    }
    clearField() {
      markController.clear();
      creditController.clear();
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("CGPA Calculator"),
        centerTitle: true,
        elevation: 6,
        //backgroundColor: Colors.blueAccent,
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 40, 25, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your CGPA : ${finalCgpa.toStringAsFixed(2)}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(height: 15,),
              TextField(
                controller: markController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Mark",
                  //hintText: "Mark",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8)
                    )
                  ),
                  //isDense: true,
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: creditController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Credit",
                  //hintText: "Mark",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(8)
                      )
                  ),
                  //isDense: true,
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: (){
                    marks = markController.text.toString();
                    credits = creditController.text.toString();

                    double m = double.parse(marks);
                    double c = double.parse(credits);


                    cgpaCalculation(m, c);

                    clearField();

                    setState(() {
                      finalCgpa = CGPA/totalCredit;
                    });

                  }, child: Text("Add More")),

                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){clearField(); clearResult();}, child: Icon(Icons.refresh_rounded))
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
