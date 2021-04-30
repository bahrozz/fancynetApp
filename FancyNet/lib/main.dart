import 'package:FancyNet/SpeedTest.dart';
import 'package:FancyNet/Tether%20video.dart';
//import 'package:FancyNet/Tether.dart';
import 'package:FancyNet/Videoblock.dart';
import 'package:FancyNet/Videowifi.dart';
import 'package:FancyNet/Website.dart';
import 'package:FancyNet/video.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive/flex_widget.dart';
import 'package:responsive/responsive_row.dart';
import 'package:video_player/video_player.dart';
import 'package:wave_drawer/wave_drawer.dart';



import 'WebView1.dart';
import 'video.dart';

void main() { 
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
  runApp(
  MaterialApp(
    title:"Fancy Net",
    home:
  MyApp()));
}
class MyApp extends StatefulWidget {
 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 

  @override
  Widget build(BuildContext context) {
  
   
    return MaterialApp(
      
      home: Scaffold(
        resizeToAvoidBottomPadding: true,
        
        
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Fancy Net'),
        ),
        body: Container(
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
                  child: Center(
           child: ListView(
             children: <Widget>[
               ResponsiveRow(
                  crossAxisAlignment: WrapCrossAlignment.center,
                   children: <Widget>[
                                        SizedBox(height: MediaQuery.of(context).size.height *0.2),

                  FlexWidget(
                    
                    child: Container(
                 alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height*0.26,
                          width: MediaQuery.of(context).size.width,
               
                 decoration: BoxDecoration(
                   image:DecorationImage(
                     image: AssetImage("assets/lofgo.jpg")
                   ),
                 ),
                    ),
                    md:7,
                 mdLandOffset: 2,
                 
                 ),
                   
              
           
                     SizedBox(height: MediaQuery.of(context).size.height *0.3),
                FlexWidget(
                mdLandOffset: 1,

               child:Container(
                 alignment: Alignment.center,

         

                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     CupertinoButton(
                       color: Colors.green,
                       onPressed:(){ _checkInternetConnectivity();},
                     
                   padding: EdgeInsets.only(right: 44,left: 44,top:10,bottom: 10),
                     child: Text("پڕکردنەوەی باڵانس",
                     textAlign: TextAlign.center,
                     style: TextStyle(color: Colors.white,
                     fontSize: 15,
                     fontFamily: 'Rabar',
                     fontWeight: FontWeight.bold
                     ),
                     ),
                     ),
                    SizedBox(height: 10),
                     
                     CupertinoButton(
                         
                         color: Colors.green,
                         onPressed: (){
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (BuildContext context)
                            {
                             return Vedio(videoPlayerController: VideoPlayerController.asset("assets/videos/vedioo.mp4"),
                             looping: true,
                             );
                           }
                           )
                           );
                         },
                        padding: EdgeInsets.only(right: 20,left: 20,top:10,bottom: 10),
                       child: Text("چۆنیەتی پڕکردنەوەی باڵانس",
                       textAlign: TextAlign.center,
                       
                       style: TextStyle(color: Colors.white,
                       fontFamily: 'Rabar',
                       fontSize: 15,
                       fontWeight: FontWeight.bold
                        ),
                        ),
                       ),
                     
                     ],
                 ),
               ),
               
                    xsLand: 5,
                    smLand: 2,
                    mdLand: 1,
                    lgLand: 1,
                ),
                     SizedBox(height: MediaQuery.of(context).size.height *0.3),

                FlexWidget(
                mdLandOffset: 1,

                   xsLand: 5,
                    smLand: 2,
                    mdLand: 5,
                    lgLand: 1,
                    mdOffset: 5,
               child:Container(
            
      alignment: Alignment.center,

                  child:Column(
                    children:[
                    
                   Text("کۆمپانیای فانسی نێت بۆ دابینکردنی خزمەتگوزاری ئینتەرنێتی بێ سنوور",
                  style:TextStyle( color:Colors.white,
                  fontSize: 14,
                  
                  fontFamily: 'Rabar',
                  fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,),

              //    SizedBox(height: 10),

                  Text("ژمارەی پەیوەندی سەنتەر",
                  style:TextStyle( color:Colors.white,
                  fontSize: 14,
                  fontFamily: 'Rabar',
                  fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,),

                  SizedBox(height: 10),

                  Text("0770 224 7574",
                  style:TextStyle( color:Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,),
                  Text("0750 194 3637",
                  style:TextStyle( color:Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,),
                     ] ),),),
                   ],
               ), 
             ],
           ),
          ),
        ),
      ),
    );
  }
  _checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog(
        'ئینتەرنێتت نییە', 
        "تکایە پەیوەست بە بە هێڵی ئینتەرنێتەکەت"
      );
    } else if (result == ConnectivityResult.mobile) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return WebView1();
                      }));
    } else if (result == ConnectivityResult.wifi) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return WebView1();
                      }));
    }
  }
    _showDialog(title, text) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          
          title: Text(title,
          textAlign: TextAlign.right,
          style: TextStyle(fontWeight: FontWeight.bold,
          fontFamily: 'Rabar',
          fontSize: 25,color:Colors.red),
          
          ),
          content: Text(text,
          textAlign: TextAlign.right,
          
          style: TextStyle(fontSize: 18,color: Colors.black,
         fontFamily: 'Rabar',
        )
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('باشە'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
  _checkwifi() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog(
        'ئینتەرنێتت نییە', 
        "تکایە پەیوەست بە بە هێڵی ئینتەرنێتەکەت"
      );
    } else if (result == ConnectivityResult.mobile) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return Videowifi();
                      }));
    } else if (result == ConnectivityResult.wifi) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return Videowifi();
                      }));
    }
  }
  _checkblock() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog(
        'ئینتەرنێتت نییە', 
        "تکایە پەیوەست بە بە هێڵی ئینتەرنێتەکەت"
      );
    } else if (result == ConnectivityResult.mobile) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return Videoblock();
                      }));
    } else if (result == ConnectivityResult.wifi) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return Videoblock();
                      }));
    }
  }
  _checktether() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog(
        'ئینتەرنێتت نییە', 
        "تکایە پەیوەست بە بە هێڵی ئینتەرنێتەکەت"
      );
    } else if (result == ConnectivityResult.mobile) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return Tethervideo();
                      }));
    } else if (result == ConnectivityResult.wifi) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return Tethervideo();
                      }));
    }
  }
  _checkspeed() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog(
        'ئینتەرنێتت نییە', 
        "تکایە پەیوەست بە بە هێڵی ئینتەرنێتەکەت"
      );
    } else if (result == ConnectivityResult.mobile) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return SpeedTest();
                      }));
    } else if (result == ConnectivityResult.wifi) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return SpeedTest();
                      }));
    }
  }
  _checksite() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog(
        'ئینتەرنێتت نییە', 
        "تکایە پەیوەست بە بە هێڵی ئینتەرنێتەکەت"
      );
    } else if (result == ConnectivityResult.mobile) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return Website();
                      }));
    } else if (result == ConnectivityResult.wifi) {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                         return Website();
                      }));
    }
  }
}