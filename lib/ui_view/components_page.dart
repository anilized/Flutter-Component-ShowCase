import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_onboarding_ui_concept/ui_view/date_picker.dart';

class Components extends StatefulWidget {
  static const String routeName = "/comp";
  @override
  State<StatefulWidget> createState() => _ComponentsState();
}

enum TestRadio { test1, test2 }
TestRadio testRadio = TestRadio.test2;

class _ComponentsState extends State {
  bool radioValue = false;
  double sliderValue = 10;
  bool listTileCheck = true;
  bool isChecked = false;
  bool isSwitched = true;
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Shop',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if(selectedIndex == 1){
        Navigator.push(context,
        MaterialPageRoute(builder: (context)=>DatePickerEx()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Component Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadioListTile(
              title: Text("Test 1"),
              value: TestRadio.test1,
              groupValue: testRadio,
              onChanged: (TestRadio value) {
                setState(() {
                  testRadio = value;
                });
              },
            ),
            RadioListTile(
              title: Text("Test 1"),
              value: TestRadio.test2,
              groupValue: testRadio,
              onChanged: (TestRadio value) {
                setState(() {
                  testRadio = value;
                });
              },
            ),
            Slider(
              value: sliderValue,
              max: 20.0,
              min: 0.0,
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.grey,
              onChanged: (double newValue) {
                setState(() {
                  sliderValue = newValue;
                });
              },
            ),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeTrackColor: Colors.grey,
              activeColor: Colors.blueAccent,
            ),
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Chk 1"),
              value: listTileCheck != false,
              onChanged: (bool value) {
                setState(() {
                  listTileCheck = value ? true : false;
                });
              },
              secondary: Icon(Icons.hourglass_empty),
            ),
            CheckboxListTile(
              title: Text("Chk 2"),
              value: listTileCheck != false,
              onChanged: (bool value) {
                setState(() {
                  listTileCheck = value ? true : false;
                });
              },
              secondary: Icon(Icons.hourglass_empty),
            ),
            CheckboxListTile(
              title: Text("Chk 3"),
              value: listTileCheck != false,
              onChanged: (bool value) {
                setState(() {
                  listTileCheck = value ? true : false;
                });
              },
              secondary: Icon(Icons.hourglass_empty),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart), title: Text("Shop")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Profile")),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
