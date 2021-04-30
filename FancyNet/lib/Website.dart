
//import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

void main() => runApp(Website());

class Website extends StatefulWidget {
 
  @override
  _WebsiteState createState() => _WebsiteState();
}

class _WebsiteState extends State<Website> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        resizeToAvoidBottomPadding:false,
        backgroundColor: Colors.black87,
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
             Navigator.pop(context);
          }),
         centerTitle: true,
          backgroundColor: Colors.green,
          title: Text('FANCY NET',
          style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body:
        Container(
          
          
    //  padding: EdgeInsets.only(right: 45,left: 45,top:10,bottom: 10),
      child: _buildVideowifi(),
          )
    ),);
        }

       _buildVideowifi() {
          return WebView( 
          
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://www.fancynet.net/',
            
            
            
          );
        }
  
}
