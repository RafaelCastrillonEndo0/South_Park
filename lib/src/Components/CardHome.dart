import 'package:flutter/material.dart';
import '/src/Pages/DetailsPage.dart';  

class CardHome extends StatelessWidget {
  final String name;
  final String role;
  final String age;
  final String imagePath;
  final String hairColor;
  final String occupation;
  final String gender;
  final String updatedAt;
  final String religion;

  const CardHome({
    super.key, 
    required this.name,
    required this.role,
    required this.age,
    required this.imagePath,
    required this.hairColor,
    required this.occupation,
    required this.gender,
    required this.updatedAt,
    required this.religion
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 346,
      height: 111,
      margin:  EdgeInsets.only(bottom: 16),
      padding:  EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 3,  offset: Offset(0, 1)),
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Image.asset(imagePath, height: 76, width: 82),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.5),
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.5,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      role,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        fontSize: 14.5,
                      ),
                    ),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        Icon(Icons.auto_fix_high_rounded, size: 13),
                        SizedBox(width: 8),
                        Text(
                          age,
                          style : TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 3,
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      name: name,
                      imagePath: imagePath,
                      updatedAt: updatedAt,
                      hairColor: hairColor,
                      occupation: occupation,
                      religion: religion,
                      age: age,
                      gender: gender,
                    ),
                  ),
                );
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(30, 31, 46, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Icon(
                  Icons.arrow_forward_sharp,
                  size: 24,
                  color: const Color.fromARGB(249, 255, 255, 255),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
