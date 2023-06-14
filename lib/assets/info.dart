import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset(
                'lib/assets/FiroseMunna1.jpg',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20,),

            const Text("Name : Md. Firose Mahmud", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
            const SizedBox(height: 5,),
            const Text("Branding Name : Firose Munna", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
            const SizedBox(height: 5,),
            const Text("Age : 24 Years Old", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
            const SizedBox(height: 5,),
            const Text("Home District : Nilphamari", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
            const SizedBox(height: 5,),
            const Text("Position : Student & Mobile App Developer", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
            const SizedBox(height: 5,),
            const Text("Current Institute : BUBT, Dhaka", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
            const SizedBox(height: 5,),
            const Text("Subject : Computer Science and Engineering", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
            const SizedBox(height: 5,),
            const Text("Current Address : B-H, R-9, H-12, Mirpur-2", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
            const SizedBox(height: 5,),
            const Text("Email : munnafirose@gmail.com", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
            const SizedBox(height: 5,),
            const Text("Website : firosemunna.com", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
            const SizedBox(height: 5,),

          ],
        ),
      ),
    );
  }
}
