import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8/screens/chatpage.dart';
import 'package:flutter_application_8/widgets/buttom.dart';
import 'package:flutter_application_8/widgets/general_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Regisiterscreen extends StatefulWidget {
  Regisiterscreen({
    super.key,
  });

  @override
  State<Regisiterscreen> createState() => _RegisiterscreenState();
}

class _RegisiterscreenState extends State<Regisiterscreen> {
  late String email;
  bool isloading = false;
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
                'Register',
                style: TextStyle(fontSize: 30, color: Colors.blueAccent),
              ),
              GeneralTextfield(
                  onChanged: (data) {
                    email = data;
                    print(email);
                  },
                  hintname: 'email'),
              GeneralTextfield(
                  onChanged: (data) {
                    password = data;
                    setState(() {});
                    print(password);
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
                      await userregister();
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('weak password'),
                          ),
                        );
                      } else if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.orange,
                            content: Text(
                              'Account already exist',
                            ),
                          ),
                        );
                      }
                    } catch (e) {
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
                text: 'Register',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ALready have account',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 17),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Login ',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> userregister() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
