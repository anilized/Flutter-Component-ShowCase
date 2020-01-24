import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_ui_concept/screens/landing_page.dart';
import 'package:flutter_onboarding_ui_concept/ui_view/components_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State {
  static const String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 150.0),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  width: 100.0,
                  height: 100.0,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text('TEST APP'),
              ],
            ),
            SizedBox(
              height: 80.0,
            ),
            CupertinoTextField(
              placeholder: "Username",
              decoration: BoxDecoration(
                border:
                    Border.all(width: 2.0, color: CupertinoColors.inactiveGray),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            CupertinoTextField(
              prefix: Icon(CupertinoIcons.person_solid,
                  color: CupertinoColors.lightBackgroundGray, size: 28.0),
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
              clearButtonMode: OverlayVisibilityMode.editing,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 0.0, color: CupertinoColors.inactiveGray))),
              placeholder: "Cupertino TextField",
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>LandingPage()));
                  },
                ),
                RaisedButton(
                  child: Text('NEXT'),
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Components()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
