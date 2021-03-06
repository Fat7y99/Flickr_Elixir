import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flickr/Screens/Menu Class.dart';
import 'package:flickr/Screens/ChangePassword.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';

class SubProfile extends StatefulWidget {
  PickedFile photoFile;
  SubProfile({Key key, @required this.photoFile}) : super(key: key);
  @override
  _SubProfile createState() => _SubProfile();
}

class _SubProfile extends State<SubProfile> {
  // This widget is the root of your application.

  //PickedFile  photoFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    double deviceSizeheight = MediaQuery.of(context).size.height;
    double deviceSizewidth = MediaQuery.of(context).size.width;
    double buttonwidth = deviceSizewidth / 5;

    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool Scroll) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverSafeArea(
                  top: false,
                  sliver: SliverAppBar(
                    expandedHeight: 250,
                    //  floating: true,
                    pinned: true,
                    backgroundColor: Colors.white,
                    actions: <Widget>[
//                              actions: <Widget>[
                      PopupMenuButton(
                        onSelected: MovingTo,
                        color: Colors.white,
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.black,
                        ),
                        itemBuilder: (BuildContext context) {
                          return menu.Menu.map((String s) {
                            return PopupMenuItem<String>(
                              value: s,
                              child: Text(s),
                            );
                          }).toList();
                        },
                      ),

                      //onPressed: () {
                      // do something
                    ],
                    toolbarHeight: deviceSizeheight * .07,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        padding: EdgeInsets.only(bottom: 42.0),
                        child: FittedBox(
                          child: Image.asset('images/photo1.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      centerTitle: true,
                      titlePadding: EdgeInsets.only(bottom: 42.0),
                      title: Container(
                        padding: EdgeInsets.only(bottom: 12.0),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Column(children: <Widget>[
                            CircleAvatar(
                              backgroundImage: widget.photoFile == null
                                  ? AssetImage('images/photo1.jpg')
                                  : FileImage(File(widget.photoFile.path)),
                              radius: 35.0,
                            ),
                            Text(
                              'User 0',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.grey[900]),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    bottom: TabBar(
                      indicatorColor: Colors.grey[800],
                      unselectedLabelColor: Colors.grey[500],
                      labelColor: Colors.grey[800],
                      // These are the widgets to put in each tab in the tab bar.
                      tabs: [
                        Text(
                          'About',
                        ),
                        Text(
                          'Camera Roll',
                        ),
                        Text(
                          'Public',
                        ),
                        Text(
                          'Albums',
                        ),
                        Text(
                          'Groups',
                        ),
                      ],
                      isScrollable: true,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
              // These are the contents of the tab views, below the tabs.
              children: [
                AboutState(),
                Icon(Icons.camera),
                Icon(Icons.public),
                Icon(Icons.album_sharp),
                Icon(Icons.group),
              ]),
        ),
      ),
    );
  }

  Widget tempImage() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              //borderRadius: BorderRadius.all(Radius.circular(.05)),//add border radius here
              widget.photoFile == null
                  ? AssetImage('images/photo1.jpg')
                  : FileImage(
                      File(widget.photoFile.path),
                    ),
          fit: BoxFit.fitHeight, //add image location here
        ),
      ),
    );
  }

  void MovingTo(String destination) {
    setState(() {
      if (destination == menu.Signout) {
        Navigator.pushNamedAndRemoveUntil(context, "GetStarted", (r) => false);
      }
      if (destination == menu.ChangePassword) {
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangePassword()),
          );
        }
      }
      if (destination == menu.About) {
        launch('https://www.flickr.com/about');
      }
      if (destination == menu.Help) {
        launch('https://www.flickr.com/help/terms');
      }
      print(destination);
    });
  }
}
