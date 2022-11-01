import 'package:employ_provider/views/analytics.dart';
import 'package:employ_provider/views/components/app_bar.dart';
import 'package:employ_provider/views/components/gradient_body.dart';
import 'package:employ_provider/views/home_page.dart';
import 'package:employ_provider/views/invoices.dart';
import 'package:employ_provider/views/profile.dart';
import 'package:employ_provider/views/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper.dart';


class TabScreen extends StatefulWidget {
  const TabScreen({Key key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  final white=Colors.white;

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to exit the application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  //check?Navigator.pop(context):
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
            ],
          );
        });
  }
  final List<Widget> _children = [
    Invoices(),
    Analytics(),
    Schedule(),
    Profile(),
    HomePage()
  ];
  bool gotoHome=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color3,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          splashColor: white,
          backgroundColor: color3,
          onPressed: () {
            setState(() {
              gotoHome=true;
            });
          },
          tooltip: 'Home',
          child: Icon(Icons.home_outlined,color: white,),
          elevation: 10.0,
        ),
        body: GradientBody(
          child: gotoHome? HomePage():
          _children[_currentIndex],
        ),


        bottomNavigationBar:  BottomAppBar(
          elevation: 10,
          color: color3,
          notchMargin: 6.0,
          clipBehavior: Clip.antiAlias,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(

            selectedItemColor: btnColor,
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                gotoHome=false;
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: color3,
            unselectedItemColor: white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                // backgroundColor: white,
                icon: new Icon(Icons.inventory,),
                title: new Text('Invoices',style: TextStyle(fontSize: 13,color: white),),
              ),
              BottomNavigationBarItem(

                icon: new Icon(Icons.analytics_outlined,),
                title: new Text('Analytics',style: TextStyle(fontSize: 13,color: white),),
              ),
              BottomNavigationBarItem(

                  icon: Icon(Icons.schedule_outlined),
                  title: Text('Schedule',style: TextStyle(fontSize: 13,color: white),)),
              BottomNavigationBarItem(

                  icon: Icon(Icons.person_outline),
                  title: Text('Profile',style: TextStyle(fontSize: 13,color: white),)),

            ],
          ),
        )
    );
  }
}
