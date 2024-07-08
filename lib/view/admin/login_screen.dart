

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employe_portal/view/admin/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:employe_portal/view/user/user_inof.dart';

import 'package:employe_portal/widget/custom_button.dart';
import 'package:employe_portal/widget/custom_textformfield.dart';

class Login_Screen extends StatefulWidget {
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> authenticateUser(String email, String password) async {
    try {
      // Check admin users collection
      QuerySnapshot adminSnapshot = await FirebaseFirestore.instance
          .collection('admin')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .get();

      if (adminSnapshot.docs.isNotEmpty) {
        // Admin user found
        await setLoggedIn(isAdmin: true, email: email); // Store logged in status, admin role, and email
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => aUsers(), // Replace with your admin screen
          ),
        );
        Fluttertoast.showToast(
          msg: "Successful Login",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff2476BD),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        // Check regular users collection
        QuerySnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('AllEmployees')
            .where('email', isEqualTo: email)
            .where('password', isEqualTo: password)
            .get();

        if (userSnapshot.docs.isNotEmpty) {
          // Regular user found
          await setLoggedIn(isAdmin: false, email: email); // Store logged in status, user role, and email
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => User_Info(currentEmail: email,), // Replace with your user screen
            ),
          );
          Fluttertoast.showToast(
            msg: "Successful Login",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff2476BD),
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          // No user found
          Fluttertoast.showToast(
            msg: "Invalid email or password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff2476BD),
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred')),
      );
    }
  }

  Future<void> setLoggedIn({required bool isAdmin, required String email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setBool('isAdmin', isAdmin);
    await prefs.setString('email', email); // Save email in SharedPreferences
  }

  Future<void> showForgotPasswordDialog() async {
    TextEditingController emailController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: Colors.white,
          title: Text('Forgot Password', style: TextStyle(color: Color(0xff2476BD)),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                hintText: 'Email',
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                String email = emailController.text.trim();
                if (email.isNotEmpty) {
                  QuerySnapshot userSnapshot = await FirebaseFirestore.instance
                      .collection('AllEmployees')
                      .where('email', isEqualTo: email)
                      .get();

                  if (userSnapshot.docs.isNotEmpty) {
                    Navigator.pop(context);
                    showUpdatePasswordDialog(email);
                  } else {
                    Fluttertoast.showToast(
                      msg: "Email not found",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Color(0xff2476BD),
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                }
              },
              child:const  Text('Verify Email', style: TextStyle(color: Color(0xff2476BD)),),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel', style: TextStyle(color: Color(0xff2476BD)),),
            ),
          ],
        );
      },
    );
  }

  Future<void> showUpdatePasswordDialog(String email) async {
    TextEditingController passwordController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Update Password', style: TextStyle(color: Color(0xff2476BD),),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                hintText: 'New Password',
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                String newPassword = passwordController.text.trim();
                if (newPassword.isNotEmpty) {
                  // Update password in Firestore
                  QuerySnapshot userSnapshot = await FirebaseFirestore.instance
                      .collection('admin')
                      .where('email', isEqualTo: email)
                      .get();

                  if (userSnapshot.docs.isNotEmpty) {
                    DocumentReference userDoc = userSnapshot.docs.first.reference;
                    await userDoc.update({'password': newPassword});
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                      msg: "Password updated successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Color(0xff2476BD),
                      textColor: Colors.white,
                      fontSize: 16.0
                    );
                  }
                }
              },
              child: const Text('Update Password', style: TextStyle(color: Color(0xff2476BD)),),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel', style: TextStyle(color: Color(0xff2476BD)),),
            ),
          ],
        );
      },
    );
  }
  bool _passwordVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
              CustomTextFormField(
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Color(0xff2476BD)
                ),
                hintText: 'Email',
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email Should not be empty';
                  }
                  return null; // Return null if the input is valid
                },
              ),
              const SizedBox(
                height: 20,
              ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 30),
               child: TextFormField(
                 
                   textCapitalization: TextCapitalization.none,
                   controller: _passwordController,
                   decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                     hintText: "Password",
                     hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15),
                     suffixIcon: IconButton(
                       icon: Icon(
                         _passwordVisible ? Icons.visibility : Icons.visibility_off,
                         color: Color(0xff2476BD),
                      
                       ),
                       onPressed: () {
                         setState(() {
                           _passwordVisible = !_passwordVisible;
                         });
                       },
                     ),
                     prefixIcon: const Icon(
                       Icons.password_outlined,
                        color: Color(0xff2476BD),
                     ),
                     border: OutlineInputBorder(
                       
                       borderRadius: BorderRadius.circular(18,),
                        // Adjust the radius as needed
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(18), // Adjust the radius as needed
                       borderSide:  BorderSide(
                          color:  Colors.grey.shade300
                    // Adjust the border color as needed
                       ),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(18), // Adjust the radius as needed
                       borderSide:  BorderSide(
                         color:  Colors.grey.shade300
                        // Adjust the border color as needed
                       ),
                     ),
                   ),
                   obscureText: !_passwordVisible,
                   validator: (v) {
                     if (v == null || v.isEmpty) {
                       return "Password should not be empty";
                     } else {
                       return null;
                     }
                   },
                 ),
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
                      onTap: showForgotPasswordDialog,
                      child: Text(
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
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff2476BD),
                      textStyle: const TextStyle(fontSize: 18),
                      minimumSize: const Size.fromHeight(55),
                    ),
                    onPressed: _isLoading
                        ? null // Disable button if loading
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading =
                                    true; // Set isLoading to true immediately
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Color(0xff2476BD),
                                  content: Text(
                                    'Please wait...',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                              await authenticateUser(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                              );
                              setState(() {
                                _isLoading =
                                    false; // Set isLoading to false after completion
                              });
                            }
                          },
                    child: _isLoading
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: Color(0xff2476BD),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Text(
                                "Please Wait...",
                                style: TextStyle(
                                  color: Color(0xff2476BD),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}