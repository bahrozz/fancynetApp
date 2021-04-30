
//import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

void main() => runApp(WebView1());

class WebView1 extends StatefulWidget {
 
  @override
  _WebView1State createState() => _WebView1State();
}

class _WebView1State extends State<WebView1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        resizeToAvoidBottomPadding:false,
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black87,
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
             Navigator.pop(context);
          }),
         centerTitle: true,
          backgroundColor: Colors.green,
          title: Text('پڕکردنەوەی باڵانس',
          style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Rabar'),),
        ),
        body:
        Center(
          heightFactor: MediaQuery.of(context).size.height ,
          widthFactor:  MediaQuery.of(context).size.height ,
         
          
          
      child: _buildWebView(),
          )
    ),);
        }

       _buildWebView() {
          return WebView( 
          
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://www.google.com',
            
            
            
          );
        }
  
}
