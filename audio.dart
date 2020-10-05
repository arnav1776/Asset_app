import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

music() {
  AudioPlayer advancedPlayer;

  return Scaffold(
    body: Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Row(
        children: [
          Container(
            decoration:
                BoxDecoration(border: Border.all(), color: Colors.amber),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('Hogwarts.jpg'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    color: Colors.black,
                    onPressed: () async {
                      advancedPlayer = await AudioCache().loop('hp.mp3');
                    },
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.pause),
                    color: Colors.black,
                    onPressed: () async {
                      await advancedPlayer.pause();
                    },
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.stop),
                    color: Colors.black,
                    onPressed: () async {
                      await advancedPlayer.stop();
                    },
                  ),
                ),
              ],
            ),
          ),
           
        ],
      ),
    ),
  );
}