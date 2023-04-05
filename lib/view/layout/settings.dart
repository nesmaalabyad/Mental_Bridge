
import 'package:firebase_auth/firebase_auth.dart';

import '../../theme/pallete.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';
import 'EditScreen.dart';



class Settings extends StatelessWidget {
final user= FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 63,
                backgroundColor:Colors.blueAccent[900],

                child: const CircleAvatar(
                  backgroundColor: buttoncolor,
                  foregroundColor: Colors.white,
                  radius: 60.0,
                  child: Icon(Icons.person,size: 100,),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
                  user.email!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 18,
                  ),
                )),
            const SizedBox(
              height: 50,
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> EditScreen()));
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: buttoncolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.edit,color: Colors.white,),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,color: Colors.white,),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),



            InkWell(
              onTap: () {

              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: buttoncolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.info_outline_rounded,color: Colors.white,),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        ' Account info',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,color: Colors.white,),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: buttoncolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.add_business_outlined,color: Colors.white,),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,color: Colors.white,),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: buttoncolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.chat,color: Colors.white,),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        ' Contact Us',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,color: Colors.white,),
                    ],
                  ),
                ),
              ),
            ),


            const SizedBox(height: 20,),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child:InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: buttoncolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Icon(Icons.logout,color: Colors.white,),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          ' LOGOUT',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios,color: Colors.white,),
                      ],
                    ),
                  ),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
