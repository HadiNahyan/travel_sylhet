
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Me"),
      ),
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  foregroundImage: AssetImage("image/me.jpg"),
                  radius: 60,
                  child: Text("Md. Hadi Un Nahyan Chowdhury",style: TextStyle(),),
                )
              ],
            ),
            SizedBox(height: 10,),
            Text("Md. Hadi Un Nahyan Cowdhury",style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 23,
                decoration: TextDecoration.underline
            ),),
            SizedBox(height: 10,),
            Text("Student",style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 18),),
            SizedBox(height: 10,),
            Text("Metropolitan University,Bangladesh",style: TextStyle(
                color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Contact: "),
                TextButton(style: ButtonStyle(),onPressed: ()async{
                  await launch("mailto:hadiunnahyan2@gmail.com");
                }, child: Text("Send Email",style: TextStyle(decoration: TextDecoration.underline,fontSize: 18),))],
            )
          ],
        ),
      ),
    );
  }
}
