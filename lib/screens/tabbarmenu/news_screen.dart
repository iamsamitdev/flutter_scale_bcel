// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scale/models/NewsModel.dart';
import 'package:flutter_scale/screens/bottomnavmenu/news_items_horizontal.dart';
import 'package:flutter_scale/screens/bottomnavmenu/news_items_vertical.dart';
import 'package:flutter_scale/services/rest_api.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'ข่าวล่าสุด',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
              height: 210,
              child: FutureBuilder(
                future: CallAPI().getLastNews(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                          'เกิดข้อผิดพลาดในการโหลดข้อมูล'), // แสดงข้อความเมื่อเกิด Error
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    List<NewsModel> news = snapshot.data;
                    return newsItemHorizontalList(news); // แสดงข้อมูล
                  } else {
                    return Center(
                      child: CircularProgressIndicator(), // แสดง Loading
                    );
                  }
                },
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'ข่าวทั้งหมด',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: FutureBuilder(
                future: CallAPI().getAllNews(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                          'เกิดข้อผิดพลาดในการโหลดข้อมูล'), // แสดงข้อความเมื่อเกิด Error
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    List<NewsModel> news = snapshot.data;
                    return NewsItemVerticalList(news); // แสดงข้อมูล
                  } else {
                    return Center(
                      child: CircularProgressIndicator(), // แสดง Loading
                    );
                  }
                },
              ))
        ],
      )),
    );
  }
}
