import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payement_integration/Pages/home_page/model/car_model.dart';
import 'package:payement_integration/Pages/payement_page/payement_page.dart';

class CarContainer extends StatelessWidget {
  final String carImage;
  final String carName;
  final String carPrice;
  const CarContainer(
      {super.key,
      required this.carImage,
      required this.carName,
      required this.carPrice});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 400.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white24,
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.shade700.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(2, 4), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 350,
                height: 150,
                // color: Colors.black,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(carImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                carName,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                carPrice,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.5,
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: MaterialButton(
                  padding: EdgeInsets.all(15),
                  color: const Color.fromARGB(255, 44, 110, 224),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayementPage(),
                        settings: RouteSettings(
                          arguments: CarModel(
                              carImage: carImage,
                              carName: carName,
                              carPrice: carPrice),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Add To Cart",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
