import 'dart:ui';

import 'package:employe_portal/view/contract_employee.dart';
import 'package:employe_portal/view/create_employee.dart';
import 'package:employe_portal/view/pdfviewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Home_Screen extends StatefulWidget {

  
  String name, phone ,address, salary, contactemail, image, nationality, currance, employer, desination, contactname, contactphone, cotactemail, cotactdesination, viewcontract,viewofferletter, viewdocument;
  Home_Screen({
    Key? key,
    required this.name,
    required this.phone,
    required this.address,
    required this.image,
    required this.currance,
    required this.cotactdesination,
    required this.salary,
    required this.nationality,
    required this.contactemail,
    required this.employer,
    required this.desination,
    required this.contactname,
    required this.contactphone,
    required this.cotactemail,
    required this.viewcontract,
    required this.viewofferletter,
    required this.viewdocument,
  }) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}
void _launchPhoneDialer(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const  IconThemeData(color: Color(0xff2476BD),size: 25),
          centerTitle: true,
          backgroundColor: Colors.white,
             actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon:  const  Icon(Icons.edit, color: Color(0xff2476BD), size: 25,), // Change color as needed
                onPressed: () {
                  // Define the action when the icon is pressed
                 Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Create_Employee(

                
                ),
              ),
            );
                },
              ),
            ),
          ],
          automaticallyImplyLeading: true,
          title: Center(
              child: Text(
            "Welcome",
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                  color: Color(0xff2476BD),
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ))),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Center(
              child:CircleAvatar(
                  backgroundImage: (widget.image  != null &&
                          widget.image !.isNotEmpty)
                      ? NetworkImage(widget.image as String)
                          as ImageProvider<Object>?
                      : const AssetImage("assets/images/man2.png"),
                  radius: 70,
                ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                    title: Text(
                      "Name",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                    subtitle: Text(
                     widget.name??'',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Colors.grey,
                      size: 30,
                    ),
                    title: Text(
                      "Phone",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                    subtitle: Text(
                      widget.phone??'',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                    title: Text(
                      "Address",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                    subtitle: Text(
                     widget.address??'',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const FaIcon(
                      FontAwesomeIcons.globe,
                      color: Colors.grey,
                      size: 20.0,
                    ),
                    title: Text(
                      "Nationality",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                    subtitle: Text(
                      widget.nationality??'',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Divider(
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.work,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "Employer",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                    subtitle: Text(
                      widget.employer??"",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Divider(
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.person_2,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "Designation",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                    subtitle: Text(
                   widget.desination,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Divider(
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.payment_outlined,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "Salary",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                    subtitle: Text(
      "${widget.salary} ${widget.currance}",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Divider(
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color:
                      Colors.grey.shade300, // Adjust the border color as needed
                  width: 1, // Adjust the border width as needed
                ), // Adjust the radius as needed
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 18),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/ateca.png',
                          height: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Contact at Ateaca",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                           onTap: () {
  launchEmail();
        
          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xff2476BD),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                         onTap: () {
            _launchPhoneDialer(widget.contactphone); // Replace with the desired phone number
          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xff2476BD),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.contactname??'',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Color(0xff787878),
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                   widget.cotactdesination??'',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Color(0xff787878),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                         widget.phone??'',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                               color: Color(0xff787878),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                         widget.contactemail,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                               color: Color(0xff787878),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                      
                      
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

           GestureDetector(
  onTap: () {
    // Navigate to PDF viewer screen and pass the PDF path
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewPage(initialPdfUrl: widget.viewcontract),
      ),
    );
  },
  child: Container(
    decoration: BoxDecoration(
      color: const Color(0xff2476BD),
      borderRadius: BorderRadius.circular(35),
    ),
    width: 242,
    height: 57,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 20),
        Center(
          child: Text(
            'View Contract',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  ),
),
SizedBox(height: 10,),

  GestureDetector(
   onTap: () {
    // Navigate to PDF viewer screen and pass the PDF path
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewPage(initialPdfUrl: widget.viewofferletter),
      ),
    );
  }, 
   child: Container(
    decoration: BoxDecoration(
      color: const Color(0xff2FDAE4),
      borderRadius: BorderRadius.circular(35),
    ),
    width: 242,
    height: 57,
    child: const  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
        
        SizedBox(width: 20), // Adjust the space between the icon and the next widget
        // Add other widgets here
        Center(
          child: Text(
            'View Offer Letter',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),
            
          ),
        ),
   
   
     
      ],
    ),
   ),
 ),
 const   SizedBox(height: 10,),
           GestureDetector(
            onTap: () {
    // Navigate to PDF viewer screen and pass the PDF path
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewPage(initialPdfUrl: widget.viewdocument),
      ),
    );
  }, 
             child: Container(
               decoration: BoxDecoration(
                 color: const Color(0xffC2C2C2),
                 borderRadius: BorderRadius.circular(35),
               ),
               width: 242,
               height: 57,
               child: const  Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 
                   SizedBox(width: 20), // Adjust the space between the icon and the next widget
                   // Add other widgets here
                   Center(
                     child: Text(
                       ' View document',
                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),
                       
                     ),
                   ),
                 ],
               ),
             ),
           ),

           const SizedBox(height: 50,
           )
          ],
        ),
      ),
    );
  }
dynamic launchEmail() async {
  try{
    Uri email = Uri(
      scheme: 'mailto',
      path: widget.contactemail,
      queryParameters: {
        'subject': "Write your feedback"
      },
    );
    await launchUrl(email);
  }
  catch(e) {
    debugPrint(e.toString());
  }
}
}
