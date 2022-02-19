import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_sylhet/hotel.dart';
import 'about_me.dart';
import 'model.dart';
Color bl=Colors.black;
List<Name>FavNAme=[];
List<String>favData=[];
List<Color>clr=[bl,bl,bl,bl,bl,bl,bl,bl,bl,bl,bl,bl];
List<Icon>icn=[Icon(Icons.favorite),Icon(Icons.favorite),Icon(Icons.favorite),Icon(Icons.favorite),
  Icon(Icons.favorite),Icon(Icons.favorite),Icon(Icons.favorite),Icon(Icons.favorite),Icon(Icons.favorite),
  Icon(Icons.favorite),Icon(Icons.favorite),Icon(Icons.favorite)];
String sjD="কদমতলী বাস স্ট্যান্ড থেকে সরাসরি মাজার গেট পর্যন্ত গাড়ি পাওয়া যায়। হুমায়ুন রশীদ চত্তর থেকেও সিএননি পাওয়া যায়। মাজার গেইট পর্যন্ত ২৫-৩৫ টাকার মত ভাড়া পড়বে। এলাকার নাম দরগাহ গেইট বা শাহজালাল মাজার গেইট বললেই হবে।";
String spD="শাহজালাল মাজার থেকে লোকাল সি এন জি করে শাহপরান মাজারে যাওয়া যায়। সিলেটের বন্দর বাজার থেকে বাস/লেগুনা যোগে সরাসরি শাহপরান গেট পর্যন্ত যাওয়া যাবে ২৫-৪০ টাকার মধ্যে। আবার আম্বরখানা থেকে সিএনজি করে টিলাগর এবং টিলাগড় থেকে বাস/লেগুনা/সিএনজি সবকিছু এভেইলেবল পাবেন শাহপরান জাওয়ার জন্য।";
String jafD="সিলেট জেলার গোয়াইনঘাট উপজেলায় অবস্থিত। সিলেট জেলা সদর হতে সড়ক পথে দুরুত্ব মাত্র ৫৬ কি.মি। সিলেট থেকে যাতায়াতঃ সিলেট থেকে আপনি বাস/ মাইক্রোবাস/ সিএনজি চালিত অটোরিক্স্রায় যেতে পারেন জাফলং এ। সময় লাগবে ১ ঘন্টা হতে ১.৩০ ঘন্টা। সিলেটে থেকে বাস, মাইক্রোবাস, সিএনজি অটোরিকশা বা লেগুনায় যাওয়া যায় জাফলংয়ে। জাফলং যেতে জনপ্রতি বাসভাড়া পড়বে ৮০ টাকা। যাওয়া-আসার জন্য মাইক্রোবাসের ভাড়া পড়বে ৩০০০-৩৫০০ টাকা। সিএনজি অটোরিকশার ভাড়া পড়বে ১০০০-১২০০ টাকা। সিলেট শহরের যে কোনো অটোরিকশা বা মাইক্রোবাস স্ট্যান্ড থেকে গাড়ি রিজার্ভ করে যাওয়া যাবে জাফলংয়ে।";
String bisD="বিছনাকান্দি যেতে হলে সর্বপ্রথম আপনাকে সিলেট নগরীর আম্বরখানা পয়েন্ট যেতে হবে। সেখানে বিমানবন্দর রোডের দিকে সিএনজি স্টেশন আছে। সিএনজি রিজার্ভ করে হাদারপার নামক জায়গা পর্যন্ত গেলে ভাল হয়। পাঁচজন মিলে ১০০০টাকায় সাধারণত ভাড়া নেওয়া হয়। তবে মানুষ কম থাকলে ৮০-২০০ টাকা জনপ্রতিও যাওয়া যায়। হাদারপার বাজারটি খুব একটা বড় না আবার ছোটও না। মোটামুটি সবকিছুই পাবেন। খাবার, পানি, কাপড় সবই কিনতে পাওয়া যায়। হাদারপার বাজারেই বিছনাকান্দি-পান্থুমাই–লক্ষনছড়া যাওয়ার নৌকা পাওয়া যায়। সুন্দর বেশভুষা দেখে মাঝিরা ২০০০টাকা চেয়ে বসতে পারে। ভুলেও রাজি হবেন না। নৌকা ভাড়া আসা-যাওয়া সর্বোচ্চ ১১০০-১৫০০ টাকা হলে ভাল। দরাদরি করে এর চেয়ে কমে পেলে ভাল তবে অবশ্যই এর বেশি দামে যাবেন না। শুকনো মৌসুমে হেঁটে যাওয়া যায়। সেক্ষেত্রে সময় লাগবে ৩০-৪০ মিনিট। বর্ষাকালে নৌকায় যাওয়াই উত্তম। এক নৌকায় বিছনাকান্দি, পান্থুমাই ও লক্ষনছড়া ঘুরে দেখাবে বলে নিবেন।";
String sfD="আম্বরখানা থেকে ভোলাগঞ্জ ট্রলার ঘাট পর্যন্ত সিএনজি জনপ্রতি ১৫০ টাকা করে শুধু যাওয়া। আম্বরখানা পয়েন্ট থেকে এয়ারপোরট রোদের দিকে ৪-৫ মিনিট হাটলেই সাদা পাথর পরিবহন এবং বি আর টি স্যার বাস পাবেন। সাদাপাথরের নৌকার ঘাট পর্যন্ত ৬৫-৭০ টাকা ভাড়া নেবে যেকোন বাস। অইখান থেকে নৌকা করে মেইন সাদাপাথর স্পটে যেতে হবে। জনপ্রতি ১০০ করে নৌকায় যেতে হয় এবং সর্বচ্চ ৮ জন একটি নৌকায় যাওয়া যাবে। ৮ জনের কম হলে নৌকা ছাড়বেনা।";
String lkD="সিলেট জাফলং মহাসড়কে শহর থেকে প্রায় ৪২ কিমি দূরে সারীঘাট। সারীঘাট থেকে সাধারনতঃ নৌকা নিয়ে পর্যটকরা লালাখাল যান। স্থানীয় ইঞ্জিনচালিত নৌকায় একঘন্টা পনেরো মিনিটের মতো সময় লাগে সারী নদীর উৎসমুখ পর্যন্ত যেতে। নদীর পানির পান্না সবুজ রঙ আর দুইপাশের পাহাড় সারির ছায়া- পর্যটকদের মুগ্ধ করে। উৎসমুখের কাছাকাছিই রয়েছে লালাখাল চা বাগান।সিলেট শহর থেকে লালাখাল পর্যন্ত ৬-৮ জন বহনকারী মাইক্রো ভাড়া হতে পারে ৩৫০০ - ৪০০০ টাকার মধ্যে। ৯-১২ জন বহনকারী মাইক্রো ভাড়া হতে পারে ৪৫০০ - ৫,৫০০ টাকার মধ্যে। শুক্রবার হলে আরেকটু বেশী ও হতে পারে। সারীঘাট থেকে স্থানীয় নৌকা নিয়ে লালাখাল যেতে খরচ পড়বে ১০০০-১৫০০ টাকার মতো খরচ পড়ে। আর নাজিমগড় বোট স্টেশনের বিশেষায়িত নৌকাগুলোর ভাড়া ২০০০-৫০০০ টাকা পর্যন্ত। গাড়ী নিয়ে লালাখাল চলে গেলে রিভারকুইন রেস্টুরেন্ট থেকে আধাঘন্টার জন্য নৌকা ভাড়া পড়বে ৫০০ টাকা। দুপুরের খাবার প্রতিজন ৪০০-৫০০ টাকা।";
String sbD="সিলেট থেকে সরাসরি সিলেট-তামাবিল সড়কপথে বাস, লেগুনা, সিএনজিচালিত অটোরিকশা অথবা প্রাইভেট কারে আসতে হবে জৈন্তাপুরে। জৈন্তাপুর বাজার থেকে কিছ দূর গেলেই সড়কের ডান দিকে দেখা যাবে বর্ডার গার্ড বাংলাদেশের (বিজিবি) ডিবির হাওর বিশেষ ক্যাম্প। ক্যাম্পের পাশ দিয়ে কাঁচা সড়কে এক কিলোমিটার পথ পাড়ি দিলেই পৌঁছে যাবেন শাপলা বিলে। নৌকার ভাড়া নেবে ৩০০ থেকে ৪০০ টাকা। সারা দিনের জন্য সিএনজিচালিত অটোরিকশার ভাড়া নেবে ১৫০০ থেকে ১৮০০ টাকা। কাছাকাছি কোনো রেস্টুরেন্ট না থাকায় সঙ্গে শুকনো খাবার রাখতে পারেন।";
String rgD="প্রথম উপায়ঃ\nসিলেট থেকে জাফলং – তামাবিল রোডে সারীঘাট হয়ে সরাসরি গোয়াইনঘাট পৌঁছানো। এরপর গোয়াইনঘাট থেকে রাতারগুল বিট অফিসে আসবার জন্য ট্রলার ভাড়া করতে হবে, ভাড়া ৯০০ – ১৫০০ এর মধ্যে (আসা-যাওয়া) আর সময় লাগে দুই ঘণ্টা। বিট অফিসে নেমে ডিঙ্গি নৌকা নিয়ে বনে ঢুকতে হবে, এতে ঘণ্টাপ্রতি লাগবে ২০০-৩০০ টাকা।\n২য় উপায়ঃ\nসিলেটের আম্বরখানা পয়েন্ট থেকে সিএনজি নিয়ে গোয়াইনঘাট পৌঁছানো, ভাড়া পড়বে ৫০০ টাকা। ওসমানী এয়ারপোর্ট–শালুটিকর হয়ে যাওয়া এই রাস্তাটা বর্ষাকালে খুবই সুন্দর। এরপর একইভাবে গোয়াইনঘাট থেকে রাতারগুল বিট অফিসে আসবার জন্য ট্রলার ভাড়া করতে হবে, ভাড়া ৮০০ – ১৫০০ টাকার মধ্যে (আসা-যাওয়া) আর সময় লাগে দুই ঘণ্টা। বিট অফিসে নেমে ডিঙ্গি নৌকা নিয়ে বনে ঢুকতে হবে, এতে মাঝি ঘণ্টাপ্রতি নেবে ২০০-৩০০ টাকা।\n৩য় উপায়ঃ\nরাতারগুল- সিলেটের আম্বরখানা পয়েন্ট থেকে সিএনজি নিয়ে মোটরঘাট (সাহেব বাজার হয়ে) পৌঁছাতে হবে, ভাড়া নেবে ২০০-৩০০ টাকা আর সময় লাগবে ঘণ্টাখানেক। এরপর মোটরঘাট থেকে সরাসরি ডিঙ্গি নৌকা নিয়ে বনে চলে যাওয়া যায়, এতে ঘণ্টাপ্রতি ২০০-৩০০ টাকা লাগবে। এই তৃতীয় পথটিতেই সময় ও খরচ সবচেয়ে কম।";
String chaD="লাক্কাতুরা/মালনীছরা চা বাগানঃ সিলেটের আম্বরখানা পয়েন্ট থেকে লাক্কাতুরা বা মালনীছড়া চা বাগান যেতে দশ মিনিট সময় লাগবে। পাবলিক সিএনজিতে ভাড়া পড়বে জনপ্রতি ৫-১০ টাকা, আর রিক্সায় ১৫-২০ টাকা।";
String mkD="কুলাউড়া থেকে মাধবকুন্ডের দূরত্ব প্রায় ৩৫ কি.মি ,আপনি এখান থেকে সিএনজি রিজার্ভ করে সরাসরি মাধবকুন্ড যেতে পারেন । ভাড়া পড়বে ২৫০-৩০০ টাকা ।";
String lcD="সিলেট শহর থেকে তিনটি সড়কে কানাইঘাট সদরে পৌঁছার সুযোগ আছে। বাস অথবা সিএনজি-অটোরিক্সায় সরাসরি দরবস্ত-চতুল হয়ে কানাইঘাট সদরে যাওয়া যায়। অন্যদিকে, গোলাপগঞ্জ-চারখাই-শাহবাগ হয়ে জকিগঞ্জ সড়ক দিয়ে কানাইঘাট পৌঁছা যাবে। এছাড়া গাজী বুরহান উদ্দিন সড়ক দিয়ে সিলেট-গাছবাড়ী সড়ক দিয়ে কানাইঘাট সদরে পৌছার সুযোগ রয়েছে। সিলেট শহর থেকে কানাইঘাট সদরে বাসভাড়া সর্বোচ্চ ৬০টাকা এবং সিএনজি-অটোরিকশা ভাড়া সর্বোচ্চ ১শ’ টাকা। রিজার্ভ সিএনজি ৫শ’ ৭শ’ টাকা হবে। তিন পথেই সিএনজিযোগে যাওয়া যাবে কানাইঘাটে। কানাইঘাট উপজেলা সদর থেকে লোভাছড়ার দূরত্ব মাত্র ৯ কিলোমিটার। উপজেলা সদর থেকে সড়ক ও নদী পথে লোভাছড়ায় যাওয়া যায়। লোভাছড়ায় যাতায়াতের রাস্তাটির অর্ধেকের চেয়ে বেশি কাঁচা হওয়ায় খুবই কষ্ট করে সেখানে পৌঁছাতে হয়। তাই নদী পথে লোভাছড়ায় যাওয়াই সহজ রাস্তা। আর লোভাছড়া ঘুরতে সময় লাগবে প্রায় ৩ থেকে ৪ঘন্টা।";
String hmD='শ্রীমঙ্গল হোটেলের আশেপাশে অনেক সিন.এন.জি পাবেন, আপনাকে শ্রীমঙ্গল থেকে যেতে হবে কলাবন পাড়া, ওদের হামহাম যাব বললেই হবে। আপ ডাউন ১৫০০ টাকার মতো নিবে। কলাবন পাড়া পৌছে ওখানে চা শ্রমিক রাই গাইড হিসেবে যায়, ২০০/৩০০ টাকা নিবে গাউড। গহীন এবং পাহাড়ি বনের ভেতরে প্রায় আড়াই ঘন্টা হাটতে হবে, বনের প্রায় সাড়ে ৭ কিলো ভেতরে হাম হাম। উচু পাহারে উঠতে হবে, তাই সাবধান থাকতে হবে। সাথে অবশ্যই লাঠি নিবেন ওখান থেকে, ৫ টাকা নেবে। লবন বা গুল নিবেন জোকের জন্যে। আসা যাওয়া নিয়ে প্রায় ৫ ঘন্টা হাটতে হবে।';
List<String> dis=[sjD,spD,jafD,bisD,sfD,lkD,sbD,rgD,chaD,mkD,lcD,hmD];
List<String>travImg=["image/sahj.jpg","image/sahp.jpg","image/jaf.jpg","image/bis.jpg",
  "image/sada.jpg","image/lala.jpg","image/shap.jpg","image/rat.jpg","image/cha.jpg","image/mad.jpg",
"image/luv.jpg","image/ham.jpg"];
List<String>sjPic=["image/sahj.jpg","image/sahj2.jpg","image/sahj3.jpg"];
List<String>spPic=["image/sahp.jpg","image/sahp2.jpg","image/sahp3.jpg"];
List<String>jafPic=["image/jaf.jpg","image/jaf2.jpg","image/jaf3.jpg"];
List<String>bisPic=["image/bis.jpg","image/bis2.jpg","image/bis3.jpg",
  "imag/lok.jpg","imag/lok2.jpg","imag/lok3.jpg","imag/pan.jpg","imag/pan2.jpg",];
List<String>sadaPic=["image/sada.jpg","image/sada2.jpg","image/sada3.jpg"];
List<String>lalaPic=["image/lala.jpg","image/lala2.jpg","image/lala3.jpg"];
List<String>sapPic=["image/shap.jpg","image/shap2.jpg","image/shap3.jpg"];
List<String>ratPic=["image/rat.jpg","image/rat2.jpg","image/rat3.jpg"];
List<String>chaPic=["image/cha.jpg","image/cha2.jpg","image/cha3.jpg"];
List<String>madPic=["image/mad.jpg","image/mad2.jpg","image/mad3.jpg"];
List<String>lcPic=["image/luv.jpg","image/luv2.jpg","image/luv3.jpg"];
List<String>hmPic=["image/ham.jpg","image/ham2.jpg","image/ham3.jpg"];
List<List<String>>all=[sjPic,spPic,jafPic,bisPic,sadaPic,lalaPic,sapPic,ratPic,chaPic,madPic,lcPic,hmPic];
class Travel extends StatefulWidget {
  const Travel({Key? key}) : super(key: key);
  @override
  _TravelState createState() => _TravelState();
}
class _TravelState extends State<Travel> {
  List<String> travTitle=["শাহজালাল (রহঃ) মাজার","শাহপরান (রহঃ) মাজার","জাফলং","বিছনাকান্দি পান্থুমাই ও লক্ষনছড়া",
    "ভোলাগঞ্জ সাদা পাথর","লালাখাল", "শাপলা বিল","রাতারগুল","চা-বাগান","মাধবকুন্ড","লোভাছড়া","হামহাম ঝর্না"];
  List<Name> travell=[];
  addData(){
    for(int i=0; i<travTitle.length; i++){
      travell.add(Name(title: travTitle[i], description:dis[i],img: all[i]));
    }
  }
  @override
  void initState() {
    addData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("image/syl1.jpg"),
                  ),
                ),
                child: Text("")),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Fav(title: ,)));
              },
              child:  ListTile(
                title: Text("Favourites"),
                trailing: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>About()));
              },
              child: ListTile(
                title: Text("About Me"),
                trailing: Icon(
                  Icons.perm_identity,
                  color: Colors.blue,
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: 5,
            ),
            ListTile(
              leading: Text("Rating:"),
              title: Row(
                children: [
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                ],
              ),
              trailing: Icon(
                Icons.star,
                color: Colors.orangeAccent,
              ),
            ),
            Divider(
              thickness: 5,
              color: Colors.blue,
              height: 10,
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                  "Thanks For Downloading this app. Have a save tour. And Keep your environment fresh"),
            )
          ],
        ),
      ),
        appBar: AppBar(
          title: Text("সিলেটের বিখ্যাত পর্যটন স্থান",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
          actions: [
            TextButton(onPressed: (){
     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Hotel()));
            }, child: Text("হোটেল",style: TextStyle(
                color: Colors.black,decoration: TextDecoration.underline,
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),)
            )
          ],
        ),
        body:Container(
            height: height * .95,
            padding: EdgeInsets.all(10),
            child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: width * .28,
                      mainAxisSpacing: 40,
                      crossAxisSpacing: 20
                  ),
                  padding: EdgeInsets.all(7),
                  itemBuilder: (context, i) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5,
                              offset: Offset(2, 4)),
                        ],
                        color:
                        Colors.primaries[Random().nextInt(Colors.primaries.length)],
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Trav(name: travell[i],ind: i,icon: icn[i],)));
                        },
                        child: Image.asset(
                          travImg[i],
                          //height: 140,
                        ),
                      )
                  ),
                  itemCount: travell.length,
                ),
              ),
        );
  }
}
class Trav extends StatefulWidget {
  Name name;
  int ind;
  Icon icon;
  Trav({required this.icon,required this.name, required this.ind});
  _JafState createState() => _JafState(name: name,ind: ind,icn: icon);
}
class _JafState extends State<Trav> {
  Name name;
  int ind;
  Icon icn;
  _JafState({required this.name,required this.ind,required this.icn});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name.title),
        actions: [
          IconButton(onPressed: (){
            String msg="iiii";
            if(favData.contains(name.title)){favData.remove(name.title);}
            else {
              FavNAme.add(Name(title: name.title,
                  img: name.img,
                  description: name.description));
            }// audio.load("sada.mp3");
            // audio.play("sada.mp3");
            // audio.duckAudio=true;
            bool yn=true;
            setState((){
              clr[ind]=(clr[ind]==Colors.black?Colors.pink:Colors.black);
              //pink=(pink==Colors.black?Colors.pink:Colors.black);
              msg=(clr[ind]==Colors.pink?"Added to favourite":"Removed from favourite");
              //pink==Colors.black?Colors.pink:Colors.black;
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1),
              content: Text(msg),
            ));
          },
            icon: icn,color: clr[ind],)
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                // padding: EdgeInsets.only(top: 15,bottom: 15,right: 15),
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      autoPlay: true,autoPlayAnimationDuration: Duration(seconds: 1),
                      scrollDirection: Axis.horizontal,
                      autoPlayInterval: Duration(seconds: 2)
                  ),
                  itemCount: name.img.length,
                  itemBuilder: (context,i,pageViewIndex)=>Padding(
                    padding: EdgeInsets.all(5),child:  Image.asset(name.img[i]),
                  ),
                ),
              ),
              Text("কিভাবে যাবেন-",style: TextStyle(
                fontSize: 22,
                color: Colors.blue,
                fontWeight: FontWeight.w900,
              ),
              ),
             // TextButton(onPressed: (){}, child: Text("Play")),
              Padding(padding: EdgeInsets.all(5),child: Text(dis[ind],style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              ),
              )
            ],)
        ],),
    );
  }
  // playAudio(String path) {
  //   AudioPlayer audioPlayer=AudioPlayer();
  //   playAudio("www.otaha.mp3");
  // audioPlayer.play(path,isLocal: true);
  // }
}

class Fav extends StatefulWidget {

   Fav({required this.title});
   String title;
  @override
  _FavState createState() => _FavState(title: '');
}
class _FavState extends State<Fav> {

   String title;
   _FavState({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favourite Items"),),
      body: ListView.builder(itemBuilder: (context,i)=>Padding(padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FavScreen(
                    head: FavNAme[i].title, pic: FavNAme[i].img, des: FavNAme[i].description)));
              },
              child: Text(favData[i],style: TextStyle(fontSize: 18),),
            ),
            Divider()
          ],
        ),
      ),
        itemCount: favData.length,
      ),
    )
    ;
  }
}
class FavScreen extends StatelessWidget {
  String head;
  List<String> pic;
  String des;
  FavScreen({required this.head,required this.pic, required this.des});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(head),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                // padding: EdgeInsets.only(top: 15,bottom: 15,right: 15),
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      autoPlay: true,autoPlayAnimationDuration: Duration(seconds: 1),
                      scrollDirection: Axis.horizontal,
                      autoPlayInterval: Duration(seconds: 2)
                  ),
                  itemCount: pic.length,
                  // controller: ScrollController().animateTo(ScrollController().position.maxScrollExtent,
                  //     duration: Duration(seconds: 2), curve: Curves.easeOut()),
                  itemBuilder: (context,i,pageJesata)=>Padding(padding: EdgeInsets.all(10),child:  Image.asset(pic[i]),),
                ),
              ),

              Text("যেভাবে যাবেন-",style: TextStyle(
                fontSize: 22,
                color: Colors.blue,
                fontWeight: FontWeight.w900,
              ),
              ),
              Padding(padding: EdgeInsets.all(5),child: Text(des,style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              ),
              )
            ],)
        ],),
    );
  }
}



