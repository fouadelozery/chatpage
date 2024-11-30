import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8/screens/chatpage.dart';
import 'package:flutter_application_8/screens/regisiterscreen.dart';
import 'package:flutter_application_8/widgets/buttom.dart';
import 'package:flutter_application_8/widgets/general_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool isloading = false;
  late String email;
  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          key: formkey,
          child: ListView(
            children: [
              const SizedBox(
                height: 150,
              ),
              Center(child: Image.asset('assets/images/scholar.png')),
              const Center(
                  child: Text(
                'scolarchat',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.blue,
                ),
              )),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Sign in',
                style: TextStyle(fontSize: 30, color: Colors.blueAccent),
              ),
              GeneralTextfield(
                onChanged: (data) {
                  email = data;
                },
                hintname: 'email',
              ),
              GeneralTextfield(
                  onChanged: (data) {
                    password = data;
                  },
                  hintname: 'password'),
              const SizedBox(
                height: 30,
              ),
              Buttom(
                ontap: () async {
                  if (formkey.currentState!.validate()) {
                    isloading = true;
                    setState(() {});
                    try {
                      log(email.toString());
                      log(password.toString());
                      await userlogin();
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('User not found'),
                          ),
                        );
                      } else if (e.code == 'wrong-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.orange,
                            content: Text(
                              'Wrong password',
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.black,
                          content: Text(
                            'there was error',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      );
                    }
                    isloading = false;
                    setState(() {});
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Chatpage(
                        emails: email,
                      );
                    }));
                  }
                },
                text: 'Login',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'don have account ?',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 17),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Regisiterscreen()));
                    },
                    child: const Text('Sign up',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 17)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> userlogin() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
