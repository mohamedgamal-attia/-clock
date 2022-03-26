import 'package:flutter/material.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  String? date;
  String? time;

  List listDate=[

  ];
  List listTime=[

  ];

  void addToList()
  {
    listDate.add(date);
    listTime.add(time);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:  () {
          showDateDilog().then((value) {
            setState(() {
              print(value);
              date = value;
            });

            showTimeDilog().then((value) {
              setState(() {
                time = value;
              });
              addToList();
            });
          });
        },
        child: Icon(Icons.add),
      ),
      body:listTime.isEmpty?Center(
        child: Text(
          "enter new Alarm",
          style: TextStyle(
            color: Colors.teal,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
      ): ListView.builder(
        itemBuilder: (context,index)=>buildItem(
            time: listTime[index],
            date: listDate[index],
        ),
        itemCount: listDate.length,
      ),
    );
  }

  Widget buildItem ({required String time,required String date}){
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.label_outline,
                        color: Colors.grey,
                        size: 24,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'alarm ',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ),
                      Text("${date}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ],
                  ),
                  Text(
                    "${time}",
                    // '${alarm.hour.toString().padLeft(2, '0')}:${alarm.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  // DateRow(alarm: 'alarm')
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                  child: Container(
                    child: Switch(
                      value: true,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }


  Future showDateDilog() async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
    );
    return date.toString().substring(0, 10);
  }

  Future showTimeDilog() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    var localization= MaterialLocalizations.of(context);
    localization.formatTimeOfDay(time!).toString();
    return localization.formatTimeOfDay(time).toString();
  }
}