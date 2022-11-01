import 'package:employ_provider/views/components/app_bar.dart';
import 'package:employ_provider/views/components/gradient_body.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helper.dart';
import 'components/drawer.dart';


class Schedule extends StatefulWidget {
  const Schedule({Key key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  var date = DateTime.now();
  List scheduleList = [
    {
      "name": "ABC Company",
      "date": "10",
      "time": "5.00 am - 7.00 am"
    },
    {
      "name": "ABC Company",
      "date": "10",
      "time": "5.00 am - 7.00 am"
    },
    {
      "name": "ABC Company",
      "date": "10",
      "time": "5.00 am - 7.00 am"
    },
    {
      "name": null,
      "date": "11",
      "time": null
    },
  ];
  List btnValue=[
    true,
    false
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Schedule",true),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: color3, //This will change the drawer background to blue.
          //other styles
        ),
        child: drawer(),
      ),
      body: GradientBody(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(!btnValue[0]){
                              btnValue[0]=true;
                              btnValue[1]=false;
                            }
                          });
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width-40)/2,
                          height: 40,
                          decoration: BoxDecoration(
                              color: btnValue[0]?btnColor: color3,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)
                              )
                          ),
                          child: Center(
                            child: Text("Upcoming",style: btnValue[0]? textStyle6 : textStyle7,),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            if(!btnValue[1]){
                              btnValue[1]=true;
                              btnValue[0]=false;
                            }
                          });
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width-40)/2,
                          height: 40,
                          decoration: BoxDecoration(
                              color: btnValue[1]?btnColor: color3,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)
                              )
                          ),
                          child: Center(
                            child: Text("Shift request",style: btnValue[1]? textStyle6 : textStyle7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 70,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: color3,
                              boxShadow: [
                                BoxShadow(color: Colors.grey,blurRadius: 1)
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(DateFormat("d").format(date.add(Duration(days: index))),
                                style: TextStyle(color: color4,fontWeight: FontWeight.bold,fontSize: 16),
                              ),
                              Text(DateFormat("MMM").format(date.add(Duration(days: index))),
                                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: color4),
                              ),
                              Text(DateFormat("EEEE").format(date.add(Duration(days: index))).substring(0,3),
                                style: TextStyle(color: color4,fontWeight: FontWeight.w500,fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 15,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: scheduleList.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: color3
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(scheduleList[index]["date"],
                                  style: TextStyle(fontSize: 16,color: scheduleList[index]["time"]!=null?btnColor:color4,fontWeight: FontWeight.w400 ),
                                ),
                                Text("Aug",
                                  style: TextStyle(fontSize: 13,color: color4,fontWeight: FontWeight.w400 ),
                                )
                              ],
                            ),
                            title: Text(scheduleList[index]["name"]??"No Shift",style: textStyle8,),
                            subtitle: Text(scheduleList[index]["time"]??"-----",style: textStyle7,),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
