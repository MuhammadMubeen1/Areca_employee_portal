import 'package:employe_portal/view/create_employee.dart';
import 'package:employe_portal/widget/custom_button.dart';
import 'package:employe_portal/widget/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 84),
              child: Center(
                child: Image.asset(
                  "assets/images/atecalogo.png",
                  height: 82,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 178),
              child: Center(
                child: Text(
                  "Sign In",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        color: Color(0xff2476BD),
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormField(
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.grey,
              ),
              hintText: 'Email',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormField(
              prefixIcon: Icon(
                Icons.password_outlined,
                color: Colors.grey,
              ),
              hintText: 'Password',
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child:  Text(
                            
                           "Forgot Password?",
                          style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        color: Color(0xff2476BD),
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                            
                          ),
                        ),
                      ],
                    ),
            ),
                   const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomButton(
                text: 'Submit',
                onPressed: () {
                   Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                   Create_Employee()),
                        );
                },
                color: const Color(0xff2476BD),
                textStyle: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 8,),
           
          
          ],
        ),
      ),
    );
  }
}
