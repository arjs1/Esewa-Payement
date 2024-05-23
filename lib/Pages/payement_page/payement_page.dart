import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payement_integration/Pages/home_page/model/car_model.dart';
import 'package:payement_integration/payement/esewa_payment.dart';

class PayementPage extends StatefulWidget {
  const PayementPage({super.key});

  @override
  State<PayementPage> createState() => _PayementPageState();
}

class _PayementPageState extends State<PayementPage> {
  @override
  Widget build(BuildContext context) {
    CarModel carcontainer =
        ModalRoute.of(context)?.settings.arguments as CarModel;
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade400,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
        ),
        title: Text(
          "Time To Drive",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 25,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Selected Item",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500,
                letterSpacing: 2.0,
              ),
            ),
            Divider(
              color: const Color.fromARGB(255, 18, 66, 148),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(carcontainer.carImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              carcontainer.carName,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            Text(
              carcontainer.carPrice,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () {
                  EsewaService().useeswa();
                },
                padding: EdgeInsets.all(15),
                child: Text(
                  "Esewa",
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 44, 110, 224),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 3.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
