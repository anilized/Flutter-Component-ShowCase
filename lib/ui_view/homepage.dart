import 'package:flutter/material.dart';
import 'package:flutter_onboarding_ui_concept/screens/customer_screen.dart';
import 'package:flutter_onboarding_ui_concept/screens/products_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar Test"),
      ),
      body: Container(
        child: Center(
          child: Text("Test"),
        ),
      ),
      drawer: buildDrawer(context),
    );
  }

  Drawer createMenuItems(BuildContext context) {
    createNavigationItem(IconData iconData, String page, String routeName) {
      return ListTile(
        leading: Icon(iconData),
        title: Text(page),
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var navigationList = [
      createNavigationItem(
          Icons.account_box, "Customers", CustomerScreen.routeName),
      createNavigationItem(Icons.shop, "Products", ProductScreen.routeName),
      createNavigationItem(Icons.home, "Home", "/" ),
    ];

    ListView menuItems = new ListView(
      children: navigationList,
    );

    return Drawer(child: menuItems,);
  }

  buildDrawer(BuildContext context) {
    return new Drawer(
      child: createMenuItems(context),
    );
  }
}
