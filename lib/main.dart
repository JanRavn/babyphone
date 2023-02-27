import 'dart:async';

import 'package:flutter/material.dart';
import 'package:record/record.dart';

void main() {
  runApp(const MaterialApp(home: MicPage()));
}

class MicPage extends StatefulWidget {
  const MicPage({super.key});

  @override
  State<MicPage> createState() => _MicPageState();
}

class MicState extends ChangeNotifier {}

class _MicPageState extends State<MicPage> {
  Record myRecording = Record();
  Timer? timer;

  double volume = 0.0;
  double minVolume = -45.0;

  void startTimer() async {
    timer ??= Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      debugPrint("Timer expired");
    });
  }

  void stopTimer() async {
    timer?.cancel();
    timer = null;
  }

  void printSomething() {
    debugPrint("Somethign");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    debugPrint("Starting timer");
                    startTimer();
                  },
                  child: const Text("Start")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    debugPrint("Stopping timer");
                    stopTimer();
                  },
                  child: const Text("Stop")),
            ],
          ),
        ]),
      ),
    ));
  }
}
