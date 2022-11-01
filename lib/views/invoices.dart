import 'package:employ_provider/views/components/app_bar.dart';
import 'package:employ_provider/views/components/gradient_body.dart';
import 'package:flutter/material.dart';

import '../helper.dart';
import 'components/drawer.dart';


class Invoices extends StatefulWidget {
  const Invoices({Key key}) : super(key: key);

  @override
  _InvoicesState createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {
  List<bool> btnValue=[
    true,
    false,
    false
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Invoices", true),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: color3, //This will change the drawer background to blue.
          //other styles
        ),
        child: drawer(),
      ),
      body: GradientBody(
        child: SingleChildScrollView(
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
                            btnValue[2]=false;
                            btnValue[1]=false;
                          }
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/3.5,
                        height: 40,
                        decoration: BoxDecoration(
                            color: btnValue[0]? btnColor:color3,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)
                            )
                        ),
                        child: Center(
                          child: Text("All",style: btnValue[0]? textStyle6:textStyle5,),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(!btnValue[1]){
                            btnValue[1]=true;
                            btnValue[0]=false;
                            btnValue[2]=false;
                          }
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/3.5,
                        height: 40,
                        decoration: BoxDecoration(
                          color: btnValue[1]? btnColor: color3,
                        ),
                        child: Center(
                          child: Text("Paid",style: btnValue[1]? textStyle6:textStyle5,),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(!btnValue[2]){
                            btnValue[2]=true;
                            btnValue[0]=false;
                            btnValue[1]=false;
                          }
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/3.5,
                        height: 40,
                        decoration: BoxDecoration(
                            color: btnValue[2]? btnColor: color3,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)
                            )
                        ),
                        child: Center(
                          child: Text("Unpaid",style: btnValue[2]? textStyle6:textStyle5,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: color3,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total income",style: textStyle9,),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text("\$",style: textStyle4,),
                            SizedBox(width: 5,),
                            Text("40000.00",style: textStyle10,)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
