import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:triply/utils/data.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontFamily: 'Ubuntu-Regular',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          Map datar = data[index % data.length];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(datar['story']),
              radius: 25,
            ),
            title: Text(
              "${datar['name']} liked your trip to ${datar['location']}",
              style: TextStyle(
                fontFamily: 'Ubuntu-Regular',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "2 hours ago",
              style: TextStyle(
                fontFamily: 'Ubuntu-Regular',
                fontSize: 12,
              ),
            ),
            trailing: Icon(
              Ionicons.heart,
              color: Colors.red,
              size: 20,
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
