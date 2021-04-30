
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


void main() => runApp(Tethervideo());

class Tethervideo extends StatefulWidget {
  @override
  _VideoblockState createState() => _VideoblockState();

  

}
 String videoURL = "https://www.youtube.com/watch?v=SXE5bzSewn4&ab_channel=FANCYNET";

  YoutubePlayerController _controller;
class _VideoblockState extends State<Tethervideo> {
    @override
  void initState() {
    
    _controller = YoutubePlayerController(
      
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL),
      flags: YoutubePlayerFlags(
        autoPlay: true,
        
    

      
        

      )
      
    );

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     

 
    home: Scaffold(
      
      appBar: AppBar(
        
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            
             Navigator.pop(context);
             
             
          }),
         centerTitle: true,

        backgroundColor: Colors.green,
        title: Text("Tetherبەکارهێنانی بەرنامەی",
        textAlign: TextAlign.center,
        style:TextStyle( fontFamily: 'Rabar',
        )),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          
          child: Column(
            children: <Widget>[
              
              YoutubePlayer(
                controller: _controller,
               showVideoProgressIndicator: true,
               bottomActions: [
                 
                 ProgressBar(
                   controller: _controller,
                   isExpanded: true,
                 )
                 

                  

               ],
               
              ),
             
              
            ],
            
          ),
        ),
      ),

      
    ));
  }}