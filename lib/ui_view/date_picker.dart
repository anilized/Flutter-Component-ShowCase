import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DatePickerEx extends StatefulWidget {
  static const String routeName = "/dater";
  DatePickerEx({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => _DatePickerExState();
}

class _DatePickerExState extends State {
  String _selectedDate = 'Tap to select Date';
  DateTime _setDate = DateTime.now();
  Duration initialTimer = new Duration();
  int selectItem = 1;

  @override
  Widget build(BuildContext context) {
    String dropDownValue = 'One';
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Pickers"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: dropDownValue,
                icon: Icon(Icons.arrow_downward),
                elevation: 16,
                onChanged: (String newValue) {
                  setState(() {
                    dropDownValue = newValue;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              MaterialButton(
                child: Text("Cupertino Date Picker",
                    style: TextStyle(color: CupertinoColors.white)),
                color: CupertinoColors.activeBlue,
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext builder) {
                        return Container(
                          height:
                              MediaQuery.of(context).copyWith().size.height / 3,
                          child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (DateTime newDate) {
                              print(newDate);
                            },
                            mode: CupertinoDatePickerMode.date,
                          ),
                        );
                      });
                },
              ),
              MaterialButton(
                child: Text(
                  "Cupertino Time Picker",
                  style: TextStyle(color: CupertinoColors.white),
                ),
                color: CupertinoColors.activeBlue,
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext builder) {
                        return Container(
                          height:
                              MediaQuery.of(context).copyWith().size.height / 3,
                          child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (DateTime newDate) {
                              print(newDate);
                            },
                            mode: CupertinoDatePickerMode.time,
                          ),
                        );
                      });
                },
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                tooltip: 'Tap to open date picker',
                onPressed: () {
                  _selectDate(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2500),
    );

    if (d != null) {
      setState(() {
        _selectedDate = new DateFormat.yMMMd("en_US").format(d);
      });
    }
  }
}
