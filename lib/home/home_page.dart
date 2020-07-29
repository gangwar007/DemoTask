import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/utils/app_styles.dart';
import 'package:flutter_app_demo/view_model/home_view_model.dart';
import 'package:scoped_model/scoped_model.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);



  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  HomeViewModel _model;

  List _tripTupe =
  ["Round Trip", "Single Trip"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentTrip;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _model = new HomeViewModel();
    _dropDownMenuItems = getDropDownMenuItems();
    _currentTrip = _dropDownMenuItems[0].value;
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String trip in _tripTupe) {
      items.add(new DropdownMenuItem(
          value: trip,
          child: new Text(trip)
      ));
    }
    return items;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ScopedModel<HomeViewModel>(
        model: _model,
        child: new Scaffold(
          backgroundColor: Colors.grey,
          appBar: appBar(),
          body: body(),

        )
    );
  }

  Widget appBar() {
    return new AppBar(

      backgroundColor: AppStyles.blueColor,
      title: new Row(
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(left: 7.0)),
          new Flexible(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text("Flight / UK Trip",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                    ),
                    overflow: TextOverflow.ellipsis,

                  ),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.search),
                      new Padding(padding: EdgeInsets.only(left: 10.0)),
                      Icon(Icons.calendar_today),
                      new Padding(padding: EdgeInsets.only(left: 10.0)),
                      Icon(Icons.add_alert),

                    ],
                  )
                ],
              )

          )
        ],
      ),
    );
  }

  Widget body() {
    return new ScopedModelDescendant<HomeViewModel>(
        builder: (context, child, model) {
          return new Container(
            child: new Column(
              children: <Widget>[
                bookingType(),
                filterType(),
                tripDetail(),
                result(),
                balanceButton()
              ],
            ),
          );
        }
    );
  }


  Widget bookingType() {
    return new ScopedModelDescendant<HomeViewModel>(
        builder: (context, child, model) {
          return new Container(
            padding: EdgeInsets.all(10.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: FlatButton(
                    onPressed: () =>
                    {
                      model.buttonType = 0
                    },
                    color: model.buttonType == 0 ? Colors.blueGrey : Colors
                        .white,
                    padding: EdgeInsets.all(10.0),
                    child: Column( // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.flight),
                        Text("Flights")
                      ],
                    ),
                  ),),
                new Padding(padding: EdgeInsets.only(left: 10.0)),
                new Expanded(
                  child: FlatButton(
                    onPressed: () =>
                    {
                      model.buttonType = 1
                    },
                    color: model.buttonType == 1 ? Colors.blueGrey : Colors
                        .white,
                    padding: EdgeInsets.all(10.0),
                    child: Column( // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.directions_car),
                        Text("Book a Car")
                      ],
                    ),
                  ),),
                new Padding(padding: EdgeInsets.only(left: 10.0)),
                new Expanded(
                  child: FlatButton(
                    onPressed: () =>
                    {
                      model.buttonType = 2
                    },
                    color: model.buttonType == 2 ? Colors.blueGrey : Colors
                        .white,
                    padding: EdgeInsets.all(10.0),
                    child: Column( // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.local_car_wash),
                        Text("Self Drive")
                      ],
                    ),
                  ),),
              ],
            ),
          );
        });
  }

  Widget filterType() {
    return new Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Row(
                children: <Widget>[
                  new DropdownButton(
                    value: _currentTrip,
                    items: _dropDownMenuItems,
                    onChanged: changedDropDownItem,
                  ),
                  new Padding(padding: EdgeInsets.only(left: 12.0)),
                  new Icon(Icons.person_add)
                ],
              )),
          new Icon(Icons.filter_list)
        ],
      ),
    );
  }

  void changedDropDownItem(String selectedTrip) {
    setState(() {
      _currentTrip = selectedTrip;
    });
  }

  Widget tripDetail() {
    return new Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Icon(Icons.pin_drop),
              new Padding(padding: EdgeInsets.only(left: 10.0)),
              new Expanded(
                  child: new Row(
                    children: <Widget>[
                      new Expanded(child: TextField(
                          style: TextStyle(
                            fontSize: 14,
                            height: 0.0,
                          ),
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black54, width: 5.0),
                            ),
                          )
                      )),
                      new Padding(padding: EdgeInsets.only(left: 10.0)),
                      new Expanded(child: TextField(
                          style: TextStyle(
                            fontSize: 14,
                            height: 0.0,
                          ),
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black54, width: 5.0),
                            ),
                          )
                      )
                      ),
                    ],
                  )),
            ],
          ),
          new Padding(padding: EdgeInsets.only(top: 10.0)),
          new Row(
            children: <Widget>[
              new Icon(Icons.calendar_today),
              new Padding(padding: EdgeInsets.only(left: 10.0)),
              new Expanded(
                  child: new Row(
                    children: <Widget>[
                      new Expanded(child: TextField(
                          style: TextStyle(
                            fontSize: 14,
                            height: 0.0,
                          ),
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black54, width: 5.0),
                            ),
                          )
                      )),
                      new Padding(padding: EdgeInsets.only(left: 10.0)),
                      new Expanded(child: TextField(
                          style: TextStyle(
                            fontSize: 14,
                            height: 0.0,
                          ),
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black54, width: 5.0),
                            ),
                          )
                      )
                      ),
                    ],
                  )),
            ],
          ),
          new Padding(padding: EdgeInsets.only(top: 10.0)),
          new Row(
            children: <Widget>[
              new Icon(Icons.filter_list),
              new Padding(padding: EdgeInsets.only(left: 10.0)),
              new Expanded(
                  child: new Row(

                    children: <Widget>[
                      FlatButton(
                        onPressed: () =>
                        {
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.white,
                        padding: EdgeInsets.all(10.0),
                        child: Column( // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Text("Stops")
                          ],
                        ),
                      ),
                      new Padding(padding: EdgeInsets.only(left: 10.0)),
                      FlatButton(
                        onPressed: () =>
                        {
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.white,
                        padding: EdgeInsets.all(10.0),
                        child: Column( // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Text("Airlines")
                          ],
                        ),
                      ),
                      new Padding(padding: EdgeInsets.only(left: 10.0)),
                      FlatButton(
                        onPressed: () =>
                        {
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.white,
                        padding: EdgeInsets.all(10.0),
                        child: Column( // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Text("Duration")
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          new Padding(padding: EdgeInsets.only(top: 10.0)),
          FlatButton(
            onPressed: () =>
            {
            },
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.blueGrey,
            padding: EdgeInsets.only(left: 100.0, right: 100.0),
            child: Column( // Replace with a Row for horizontal icon + text
              children: <Widget>[
                Text("Search Flights")
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget result() {
    return new SingleChildScrollView(
     child:  new Container(
          height: 300.00,
         margin: EdgeInsets.all(10.0),
         padding: EdgeInsets.all(30.0),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.all(Radius.circular(40.0)),
           color: Colors.white,
         ),
         child:new Column(
           children: <Widget>[
             new Text('Recent',
               textAlign: TextAlign.left,),
             Divider(
                 color: Colors.grey
             ),

             new Expanded(child: new ListView.separated(
               physics: const AlwaysScrollableScrollPhysics(),
               shrinkWrap: true,
               itemCount: 10,
               separatorBuilder: (context, index) {
                 return Divider();
               },
               itemBuilder: (context, index) {
                 return new Container(
                   width: double.infinity,
                   height: 50,
                   child: new Row(
                     children: <Widget>[
                       ClipRRect(
                         borderRadius: BorderRadius.circular(8.0),
                         child: Image.asset(
                           'images/india.jpg',
                           width: 80.0,
                           height: 110.0,
                           fit: BoxFit.fill,
                         ),
                       ),

                       new Padding(padding: EdgeInsets.only(left:10.0)),
                       new Expanded(
                           child: new Container(
                             padding: EdgeInsets.only(left:10, right: 10),
                             child: new Row(
                               children: <Widget>[
                                 new Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: <Widget>[
                                     Text('London'),
                                     Text('Non-stop',
                                       style: new TextStyle(
                                           fontSize: 10
                                       ),)
                                   ],
                                 ),
                                 new Padding(padding: EdgeInsets.only(left: 10)),
                                 Text('1h 40m',
                                   style: new TextStyle(
                                       fontSize: 10
                                   ),)
                               ],
                             ),
                           )),
                       Text("\$ 320",
                         style: new TextStyle(
                             fontSize: 20,
                             color: Colors.black,
                             fontWeight: FontWeight.bold
                         ),)

                     ],
                   ),
                 );
               },
             ))
           ],
         )

     ),
    );
  }

  Widget balanceButton(){
    return new Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: FlatButton(
        onPressed: () =>
        {
        },
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0)),
        color: AppStyles.blueColor,
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,// Replace with a Row for horizontal icon + text
          children: <Widget>[
            Icon(Icons.home,
            color: Colors.white,),
            new Padding(padding: EdgeInsets.only(left: 90)),
            new Center(
              child: Text("Balance \$ 3333",
              style: new TextStyle(
                color: Colors.white
              ),),
            )
          ],
        ),
      ),
    );
  }
}
