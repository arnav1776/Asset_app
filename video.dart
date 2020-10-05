import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Future<void> initializePlayer;
VideoPlayerController videoPlayerController;

class NetworkVideo extends StatelessWidget {
  build(BuildContext b) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  build(BuildContext b) {
    return Container(
      color: Colors.amberAccent,
      child: Column(
        children: <Widget>[
          FutureBuilder(
              future: initializePlayer,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(child: VideoPlayer(videoPlayerController)),
                  );
                } else {
                  return AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      color: Colors.black,
                    ),
                  );
                }
              }),
          Container(
            padding: EdgeInsets.only(bottom: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: RaisedButton(
                  child: Text("PLAY"),
                  onPressed: () {
                    setState(() {});
                    videoPlayerController = VideoPlayerController.network(
                        "https://media.istockphoto.com/videos/concept-coronavirus-word-highlighted-in-random-texts-similar-to-in-video-id1213768570");
                    initializePlayer = videoPlayerController.initialize();
                    videoPlayerController.setVolume(5.0);
                    //videoPlayerController.initialize();
                    videoPlayerController.play();
                    // setup();
                  },
                ),
              ),
              Container(
                child: RaisedButton(
                  child: Text("Pause"),
                  onPressed: () {
                    videoPlayerController.pause();
                    //videoPlayerController.dispose();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}