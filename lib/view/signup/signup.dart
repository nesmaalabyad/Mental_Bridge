
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../auth.dart';
import '../../theme/pallete.dart';
import '../layout/layout.dart';
import '../login/login.dart';







class SignUp extends StatefulWidget {


  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int currentindex=0;

  var scaffoldkey=GlobalKey<ScaffoldState>();

  var formkey=GlobalKey<FormState>();

  var nameController=TextEditingController();

  var emailController=TextEditingController();

  var passwordController=TextEditingController();
  var confirmpasswordController=TextEditingController();

  var phoneController=TextEditingController();

  List<String> options = ['Doctor', 'Patient'];

  String? selectedOption;

  Future signUp() async {
    if(passwordController.text.trim()==confirmpasswordController.text.trim()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Auth(),
          ));
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: primary,
      body:



      SafeArea(

        child: SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(height: 20,),
              //icon
             Center(child: Image.asset("assets/images/logo-no-background.png",width: 200,height: 200,color: buttoncolor,),),

              // loginnnnnnnnnnnn
              Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text('Sign up',style: TextStyle( color:buttoncolor,fontSize: 40,fontWeight: FontWeight.w900,fontStyle: FontStyle.italic),))

                      ],
                    ),


              SizedBox(height: 25,),
              //form fildddd
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.03),
                          spreadRadius: 10,
                          blurRadius: 3,
                          // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 15, bottom: 5, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        TextField(
                          controller: emailController,
                          cursorColor: black,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: black),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              prefixIconColor: black,
                              hintText: "Email",
                              border: InputBorder.none),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.03),
                          spreadRadius: 10,
                          blurRadius: 3,
                          // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 15, bottom: 5, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        TextField(
                          obscureText: true,
                          controller: passwordController,
                          cursorColor: black,
                          style: TextStyle(

                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: black),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                              prefixIconColor: Colors.black,

                              suffixIconColor: Colors.black,
                              hintText: "password",
                              border: InputBorder.none),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.03),
                          spreadRadius: 10,
                          blurRadius: 3,
                          // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 15, bottom: 5, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Confirm password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        TextField(
                          obscureText: true,
                          controller: confirmpasswordController,
                          cursorColor: black,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: black),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                              prefixIconColor: Colors.black,

                              suffixIconColor: Colors.black,
                              hintText: "password",
                              border: InputBorder.none),
                        ),
                      ],
                    ),
                  )),

              SizedBox(height: 30,),
              //button and text
              Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      signUp();
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Layout(),
                      //     ));
                    },
                    child: Container(

                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(

                          color:buttoncolor, borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){

                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=>login()),
                      );


                    },
                    child:  Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Have account? ",
                              style: TextStyle(color: Colors.black,fontSize: 18),
                            ),
                          ),
                          Text(
                            " Login",
                            style: TextStyle(color: Colors.blue,fontSize: 18),
                          ),

                        ],
                      ),

                  ),
                ],
              ),

            ],
          ),
        ),
      ),









    );
  }
}
