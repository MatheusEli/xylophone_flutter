import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  Future<void> playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  TextButton buildKey({required Color color, required int soundNumber}) {
    return TextButton(
      onPressed: () {
        playSound(soundNumber);
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Center(
          child: Icon(
            CupertinoIcons.play_fill,
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildKey(color: Colors.blue, soundNumber: 1),
                  buildKey(color: Colors.green, soundNumber: 2),
                  buildKey(color: Colors.yellow, soundNumber: 3),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildKey(color: Colors.black, soundNumber: 4),
                  buildKey(color: Colors.orange, soundNumber: 5),
                  buildKey(color: Colors.grey, soundNumber: 6),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [buildKey(color: Colors.red, soundNumber: 7)],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
