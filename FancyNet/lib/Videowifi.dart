import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() => runApp(Videowifi());

class Videowifi extends StatefulWidget {
  @override
  _VideoblockState createState() => _VideoblockState();
}
 String videoURL = "https://www.youtube.com/watch?v=Yqq_6CJw720&feature=emb_logo&ab_channel=FANCYNET";
  YoutubePlayerController _controller;
class _VideoblockState extends State<Videowifi> {
    @override
  void initState() {
    
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL)
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
        title: Text("گۆڕینی ووشەی نهێنی وایەرلێس",
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