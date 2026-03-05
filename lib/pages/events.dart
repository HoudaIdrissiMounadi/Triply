import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:triply/utils/data.dart';
import 'package:triply/widgets/appbar.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          Map datar = data[index % data.length];
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Travel Meetup ${datar['location']}",
                      style: TextStyle(
                        fontFamily: 'Ubuntu-Regular',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Iconsax.calendar, size: 20, color: Colors.red),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Iconsax.location, size: 15, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      "${datar['city']}, ${datar['location']}",
                      style: TextStyle(
                        fontFamily: 'Ubuntu-Regular',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Iconsax.clock, size: 15, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      "Aug 15, 2024 - 10:00 AM",
                      style: TextStyle(
                        fontFamily: 'Ubuntu-Regular',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      height: 30,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, i) {
                          return Align(
                            widthFactor: 0.6,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(data[(i + index) % data.length]['story']),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "+15 participants",
                      style: TextStyle(
                        fontFamily: 'Ubuntu-Regular',
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Join Event",
                      style: TextStyle(fontFamily: 'Ubuntu-Regular', color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
