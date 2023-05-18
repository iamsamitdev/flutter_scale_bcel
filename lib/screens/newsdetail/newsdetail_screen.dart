// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {

    // รับค่าที่ส่งมาจากหน้า NewsItemHorizontalList
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    // print(arguments['news']['topic']);

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['news']['topic']),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(arguments['news']['imageurl']),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              arguments['news']['topic'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              arguments['news']['detail'],
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}