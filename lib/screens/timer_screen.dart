import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {

  final CustomTimerController _controller = CustomTimerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTimer(
              controller: _controller,
              begin: Duration(minutes: 5),
              end: Duration(),
              builder: (time) {
                return Text(
                    "${time.hours}:${time.minutes}:${time.seconds}.${time.milliseconds}",
                    style: TextStyle(fontSize: 24.0)
                );
              }
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                color: Colors.green,
                onPressed: (){
                  _controller.start();
                },
              child: Text(
                "Start"
              ),
              ),
              RaisedButton(
                color: Colors.teal,
                onPressed: (){
                  _controller.pause();
                },
              child: Text(
                "Pause"
              ),
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: (){
                  _controller.reset();
                },
              child: Text(
                "Reset"
              ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
