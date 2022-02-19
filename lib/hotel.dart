import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Hotel extends StatefulWidget {

  @override
  _HotelState createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  Widget hotelView(String name,String place, String num){
    return ListTile(
      title: Text(name),
      subtitle: Text(place),
      onTap: ()async{
        await launch("tel:$num");
      },
      trailing: Icon(Icons.call),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("সিলেট শহরে থাকার জন্য হোটেল"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          hotelView("হোটেল রোজ ভিউ","শাহজালাল উপশহর","0821721439"),
          hotelView("হোটেল স্টার প্যাসিফিক","দরগা গেইট","0821727945"),
          hotelView("হোটেল মেট্রো ইন্টারন্যাশনাল","বন্দরবাজার","0821716077"),
          hotelView("হোটেল হিলটাউন","ভিআইপি রোড","0821721143"),
          hotelView("হোটেল ফরচুন গার্ডেন","নাইওরপুলে","0821715590"),
          hotelView("হোটেল ডালাস","জেল রোড","0821720945"),
          hotelView("হোটেল গার্ডেন ইন","লিঙ্ক রোড","0821814507"),
          hotelView("হোটেল পলাশ","আম্বরখানা","0821718309"),
          hotelView("হোটেল দরগাগেইট","দরগা গেইট","0821717066"),
          hotelView("হোটেল উর্মি","দরগা গেইট","0821714563"),
          hotelView("হোটেল মুন লাইট","জিন্দাবাজার","0821714580"),
          hotelView("গুলশান সেন্টার","তালতলায়","0821710018"),
        ],
      ),
    );
  }
}
