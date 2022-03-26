import 'package:clockapp/screens/alarm_screen.dart';
import 'package:clockapp/screens/clock_screen.dart';
import 'package:clockapp/screens/stop_watch_screen.dart';
import 'package:clockapp/screens/timer_screen.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar:AppBar(
          title: Text(
            "Clock App",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Image.asset('assets/world_icon.png' , height: 30,),
                child: Text('Alarm'),
              ),
              Tab(
                icon: Image.asset('assets/alarm_clock.png' , height: 30,),
                child: Text('Clock'),

              ),
              Tab(
                icon: Image.asset('assets/timer_icon.png' , height: 30,),
                child: Text('Timer'),

              ),
              Tab(
                icon: Image.asset('assets/stopwatch_icon.png' , height: 30 ,),
                child: Text('Stop watch',style: TextStyle(
                  fontSize: 10
                ),),

              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AlarmScreen(),
            ClockScreen(),
            TimerScreen(),
            StopWatchScreen(),
          ],
        ),
      ),
    );
  }
}
