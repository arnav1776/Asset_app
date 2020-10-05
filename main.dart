import 'ui/audio.dart';
import 'ui/video.dart';

import 'package:flutter/material.dart';

main() {
  runApp(MediaPlayer());
}

class MediaPlayer extends StatelessWidget {
  build(BuildContext b) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length:2,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.mobile_screen_share),
            actions: <Widget>[
              Icon(Icons.music_video),
            ],
            title: Text("Music Player"),
            backgroundColor: Colors.black,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.audiotrack),
                  text: "Audio",
                ),
                Tab(
                  icon: Icon(Icons.live_tv),
                  text: "Video",
                ),
                
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [.1, .9],
                  colors: [Colors.blueAccent, Colors.redAccent]),
            ),
            child: TabBarView(
              children: [
                music(),
                NetworkVideo(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}