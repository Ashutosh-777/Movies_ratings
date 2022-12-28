import 'package:a_2/sign_uppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:a_2/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// var name_1;

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
 // final TextEditingController emailAddress =TextEditingController();
  //final TextEditingController password =TextEditingController();
  var emailAddress='';
  var password='';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login into your account')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('LogIn',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 55),
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
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value){
                  //name_1=value;
                },
                cursorColor: Colors.grey,

                cursorHeight: 24,
                style: const TextStyle(
                  fontSize: 18,
                ),
                decoration:  InputDecoration(
                  hintText: 'Enter Your Name',
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

               // controller: my_name,
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
                onChanged: (value){
                  emailAddress=value;
                },
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

               // controller: emailAddress,
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
                onChanged: (value){
                  password=value;
                },
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
               // controller: password,
              ),
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.end ,
              children: [
                TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (BuildContext context)=> sign_up_page(),
                          )
                      );
                    },
                    child: const Text("Don't have an account?",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white24,

                      ),
                    ),
                ),
                TextButton(
                    onPressed: () async{
                      print('hi');
                      try {
                        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailAddress,
                          password: password,
                        );
                         Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (BuildContext context)=> HomeScreen(
                          )),
                        );
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(builder: (BuildContext name_1)=> HomeScreen()),
                        // );


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

                        print(e.toString());
                      }


                    },

                    child: const Text('login',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white24,

                      ),
                    )
                ),

              ],
            ),


          ],
        ),
      ),
    );
  }
}


