
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class sign_up_page extends StatefulWidget {
  const sign_up_page({Key? key}) : super(key: key);

  @override
  State<sign_up_page> createState() => _sign_up_pageState();
}

class _sign_up_pageState extends State<sign_up_page> {
  final TextEditingController emailAddress =TextEditingController();
  final TextEditingController password =TextEditingController();




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Register yourself')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('SignUp',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 95),
              child: Center(
                child: ClipRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Card(
                    clipBehavior: Clip.antiAlias,

                    elevation: 4.0,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.network(
                      'https://traveloffice.org/wp-content/uploads/2015/05/hollywood-wax-museum-branson-1.jpg',
                      height: 200,
                      width: 139,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),


            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Email Address',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.grey,

                cursorHeight: 24,
                style: const TextStyle(
                  fontSize: 18,
                ),
                decoration:  InputDecoration(
                  hintText: 'Enter Your Email',
                  filled: true,
                  fillColor: Colors.white70,
                  focusedBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white70,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white70,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),

                controller: emailAddress,
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Password',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.grey,

                cursorHeight: 24,
                style: const TextStyle(
                  fontSize: 18,
                ),
                decoration:  InputDecoration(
                  hintText: 'Enter your Password',
                  filled: true,
                  fillColor: Colors.white70,
                  focusedBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white24,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white70,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                controller: password,
              ),
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.end ,
              children: [
                TextButton(
                    onPressed: ()async{
                      try {
                        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailAddress.text,
                          password: password.text,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (BuildContext context)=> const Login_page()),
                        );
                      } on FirebaseAuthException catch (e) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text(e.toString()),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        print(e);
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text(e.toString()),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        print(e);
                      }

                    },

                    child: const Text('Sign-up',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white24,

                      ),
                    )
                ),
                TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (BuildContext context)=> const Login_page()),
                      );
                    },
                    child: const Text('Already have an account?',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white24,

                      ),
                    )
                )
              ],
            ),


          ],
        ),
      ),
    );

  }
}