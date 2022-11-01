import 'package:employ_provider/views/availability.dart';
import 'package:employ_provider/views/change_password.dart';
import 'package:employ_provider/views/gain.dart';
import 'package:employ_provider/views/help_support.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper.dart';

drawer() {
  return Drawer(
    child: ListView(
      children: [
        SizedBox(height: 20,),
        ListTile(
          leading: Container(
            height: 60,width: 60,
            decoration: BoxDecoration(
              color: color3,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.white
                )
              ]
            ),
            child: Icon(Icons.person_outline,color: Colors.white,),
          ),
          title: Text("Manas Saha",style: TextStyle(color: Colors.white),),
          subtitle: Text("ABC Enterprise",style: TextStyle(color: color4),),
        ),
        Divider(color: color4,),
        SizedBox(height: 20,),
        ListTile(
          leading: Icon(Icons.person_add_alt_1,color: color4,),
          title: Text("Labour provider",style: textStyle9,),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.attach_money_sharp,color: color4,),
          title: Text("Gain",style: textStyle9,),
          onTap: (){
            Get.to(Gain());
          },
        ),
        ListTile(
          leading: Icon(Icons.event_available,color: color4,),
          title: Text("Availability",style: textStyle9,),
          onTap: (){
            Get.to(Availability());
          },
        ),
        ListTile(
          leading: Icon(Icons.lock_outline,color: color4,),
          title: Text("Change Password",style: textStyle9,),
          onTap: (){
            Get.to(ChangePassword());
          },
        ),
        ListTile(
          leading: Icon(Icons.help,color: color4,),
          title: Text("Help & Support",style: textStyle9,),
          onTap: (){
            Get.to(HelpSupport());
          },
        ),
        ListTile(
          leading: Icon(Icons.power_settings_new_rounded,color: color4,),
          title: Text("Logout",style: textStyle9,),
          onTap: (){},
        ),
      ],
    ),
  );
}
