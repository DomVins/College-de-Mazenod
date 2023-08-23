import 'package:flutter/material.dart';

text(String t, Color c, double s, FontWeight w, FontStyle f, double space) {
  return Text(
    t,
    style: TextStyle(
        color: c,
        fontSize: s,
        fontWeight: w,
        fontStyle: f,
        letterSpacing: space),
  );
}

h_space(double width) {
  return SizedBox(
    width: width,
  );
}

v_space(double height) {
  return SizedBox(
    height: height,
  );
}

news_card(String event, String date) {
  return Container(
    decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(color: Color.fromARGB(255, 196, 194, 194)),
        ),
        h_space(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(event.toUpperCase(), Color.fromARGB(255, 20, 42, 245), 14,
                FontWeight.w700, FontStyle.normal, 1.2),
            v_space(10),
            text(date, Color.fromARGB(255, 101, 101, 102), 12, FontWeight.w600,
                FontStyle.normal, 1.0)
          ],
        )
      ],
    ),
  );
}

navbarText(String item, Color c) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    child: Text(
      item,
      style: TextStyle(
          color: c,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2),
    ),
  );
}
