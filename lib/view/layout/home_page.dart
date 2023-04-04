
import 'package:flutter/material.dart';

import '../../theme/pallete.dart';
import '3dDoctor.dart';
import 'ArRoom.dart';
import 'VrRoom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>VrRoom()),
                        );
                      });
                    },
                    child: Column(
                      children: [
                     Image.network(
                            "https://thinkjpc.com/wp-content/uploads/2016/04/woman-wearing-VR-headset.jpg",
                       width: 500,
                       height: 200,

                          ),

                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          Container(
                            width: 250,
                            height: 25,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: buttoncolor,),

                              child: Center(child: Text("Enter VR therapy room", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: white),)))
                        ],)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>ArRoom()),
                        );
                      });
                    },
                    child: Column(
                      children: [
                     Image.network(
                            "https://th.bing.com/th/id/OIP.vwh_BCq-Ij_Iw4blXc_y7AHaE7?pid=ImgDet&rs=1",
                       width: 500,
                       height: 200,
                          ),

                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 250,
                                height: 25,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: buttoncolor,),

                                child: Center(child: Text("Enter AR therapy room", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: white),)))
                          ],)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>Doc3d()),
                        );
                      });
                    },
                    child: Column(
                      children: [
                       Image.network(
                              "https://th.bing.com/th/id/OIP.ckupR4U1Lh-tifz8Fiz6-QHaJF?pid=ImgDet&rs=1",
                         width: 500,
                         height: 200,
                       ),

                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 250,
                                height: 25,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: buttoncolor,),

                                child: Center(child: Text("Talk to a 3D AI Doctor", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: white),)))
                          ],)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
        ),
       
      ),
    );
  }
}
