import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 late VideoPlayerController _controller;

 @override
 void initState() {
   super.initState();
    
   /*
   _controller = VideoPlayerController.network(
    "https://jsoncompare.org/LearningContainer/SampleFiles/Video/MP4/Sample-MP4-Video-File-for-Testing.mp4"

   )..initialize().then((_){
      setState(() {
        _controller.play();
      });
   });
   */

    _controller =  VideoPlayerController.asset(
    "assets/video/exemplo.mp4"
  )
  ..setLooping(true)
  ..initialize().then((_){

    setState(() {
      _controller.pause();
    });

  });
   
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
        child: _controller.value.isInitialized 
        ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
          )
        :Text("Pressiona no Play"),

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              _controller.value.isPlaying ? _controller.pause() : _controller.play();
            });
          },
          child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          ),
    );
  }
}