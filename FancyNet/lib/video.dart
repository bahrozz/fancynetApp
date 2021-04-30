import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Vedio extends StatefulWidget {
final VideoPlayerController videoPlayerController;
final bool looping;

Vedio({
  @required this.videoPlayerController,
  this.looping,
  Key key,
}): super(key:key);

  @override
  _VedioState createState() => _VedioState();
}

class _VedioState extends State<Vedio> {
  ChewieController _chewieController;
 
   @override
   void initState(){
     
     super.initState();
    _chewieController =ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: widget.looping,

      errorBuilder: (context,errorMessage){
        return Center(child: Text(errorMessage,
        style: TextStyle(color:Colors.white),),);
      },
    );
   }


  @override
  Widget build(BuildContext context) {
     
  
    return Scaffold(
       backgroundColor: Colors.black12,
      appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
             Navigator.pop(context);
          }),
         centerTitle: true,
          backgroundColor: Colors.green,
          title: Text('چۆنیەتی پڕکردنەوەی باڵانس',
          style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Rabar'),),
      ),
     body:Padding(padding: const EdgeInsets.all(8.0),
    child: Chewie(
      controller: _chewieController,
    ),
    ));
    



  }
  void dispose(){
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}