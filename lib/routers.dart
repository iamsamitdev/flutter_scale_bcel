import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/addproduct/addproduct_screen.dart';
import 'package:flutter_scale/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_scale/screens/drawermenu/about_screen.dart';
import 'package:flutter_scale/screens/drawermenu/contact_screen.dart';
import 'package:flutter_scale/screens/drawermenu/info_screen.dart';
import 'package:flutter_scale/screens/editproduct/editproduct_screen.dart';
import 'package:flutter_scale/screens/login/login_screen.dart';
import 'package:flutter_scale/screens/newsdetail/newsdetail_screen.dart';
import 'package:flutter_scale/screens/welcome/welcome_screen.dart';

// Router Map Keys
Map<String, WidgetBuilder> routes = {
  '/welcome': (BuildContext context) => const WelcomeScreen(),
  '/login': (BuildContext context) => const LoginScreen(),
  '/dashboard': (BuildContext context) => const DashboardScreen(),
  '/about': (BuildContext context) => const AboutScreen(),
  '/contact': (BuildContext context) => const ContactScreen(),
  '/info': (BuildContext context) => const InfoScreen(),
  '/newsdetail': (BuildContext context) => const NewsDetailScreen(),
  '/addproduct': (BuildContext context) => const AddProductScreen(),
  '/editproduct': (BuildContext context) => const EditProductScreen(),
};