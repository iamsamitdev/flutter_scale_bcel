// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_scale/models/NewsModel.dart';
import 'package:flutter_scale/screens/bottomnavmenu/news_items_horizontal.dart';
import 'package:flutter_scale/screens/bottomnavmenu/news_items_vertical.dart';
import 'package:flutter_scale/screens/tabbarmenu/news_screen.dart';
import 'package:flutter_scale/screens/tabbarmenu/products_screen.dart';
import 'package:flutter_scale/screens/tabbarmenu/stores_screen.dart';
import 'package:flutter_scale/services/rest_api.dart';
import 'package:flutter_scale/themes/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // จำนวน Tab
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: TabBar(
            splashBorderRadius: BorderRadius.circular(10),
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            indicatorColor: primaryDark,
            labelColor: primaryDark,
            tabs: [
              Tab(text: 'News',),
              Tab(text: 'Products',),
              Tab(text: 'Stores',),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            NewsScreen(),
            ProductScreen(),
            StoresScreen()
          ]
        ),
      ),
    );
  }
}
