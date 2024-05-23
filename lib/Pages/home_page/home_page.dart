import 'package:flutter/material.dart';
// import 'package:payement_integration/Pages/login_page/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payement_integration/Pages/home_page/widget/container.dart';
import 'package:payement_integration/core/utilis/car_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String logindata = ModalRoute.of(context)?.settings.arguments as String;
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: GoogleFonts.bebasNeue(
                    color: Colors.white,
                    fontSize: 40,
                    letterSpacing: 5,
                  ),
                ),
                Text(
                  logindata,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 400,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: carmodel.length,
                separatorBuilder: (BuildContext context, int index) {
                  return CarContainer(
                      carImage: carmodel[index].carImage,
                      carName: carmodel[index].carName,
                      carPrice: carmodel[index].carPrice);
                },
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 20.0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
