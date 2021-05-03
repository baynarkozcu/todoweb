import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({Key key, this.scaffoldKey}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration:
          BoxDecoration(color: Colors.black.withOpacity(0.3), boxShadow: [
        BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.white.withOpacity(0.16))
      ]),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today_rounded,
            size: 35,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "To-Do List",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Spacer(),
          MediaQuery.of(context).size.width > 750
              ? Row(
                  children: [
                    Text(
                      "Home Page",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "About",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Contact",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              : InkWell(
                  onTap: () {
                    scaffoldKey.currentState.openEndDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
        ],
      ),
    );
  }
}
