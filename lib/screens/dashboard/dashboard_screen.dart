// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_scale/screens/bottomnavmenu/home_screen.dart';
import 'package:flutter_scale/screens/bottomnavmenu/notification_screen.dart';
import 'package:flutter_scale/screens/bottomnavmenu/profile_screen.dart';
import 'package:flutter_scale/screens/bottomnavmenu/report_screen.dart';
import 'package:flutter_scale/screens/bottomnavmenu/setting_screen.dart';
import 'package:flutter_scale/themes/colors.dart';
import 'package:flutter_scale/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Create SharedPreferences Object
  late SharedPreferences sharedPreferences;

  // ตัวแปรไว้เก็บโปรไฟล์
  String? _username, _fullname, _imgProfile;

  // Create readProfile method
  readUserProfile() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _username = sharedPreferences.getString('userName');
      _fullname = sharedPreferences.getString('fullName');
      _imgProfile = sharedPreferences.getString('imgProfile');
    });
  }

  @override
  void initState() {
    readUserProfile();
    super.initState();
  }

  // ตัวแปรเก็บชื่อหน้าจอ
  String _title = 'Dashboard';

  // ตัวแปรเก็บตำแหน่งเมนูที่เลือก
  int _currentIndex = 0;

  // สร้าง List ของเมนู
  final List<Widget> _children = [
    HomeScreen(),
    ReportScreen(),
    NotificationScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];

  // สร้างฟังก์ชันเพื่อเปลี่ยนหน้าจอ
  void onTabChange(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = 'Dashboard';
          break;
        case 1:
          _title = 'Report';
          break;
        case 2:
          _title = 'Notification';
          break;
        case 3:
          _title = 'Setting';
          break;
        case 4:
          _title = 'Profile';
          break;
        default:
          _title = 'Dashboard';
          break;
      }
    });
  }

  // log out method
  void logout() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: _children[_currentIndex],
        drawer: Drawer(
          // backgroundColor: primaryLight,
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(_fullname ?? '...'),
                    accountEmail: Text(_username ?? '...'),
                    currentAccountPicture: _imgProfile != null
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(
                                baseImageURL + 'profile/' + _imgProfile!),
                          )
                        : CircularProgressIndicator(),
                    decoration: BoxDecoration(
                      color: primaryDark,
                    ),
                    otherAccountsPictures: [
                      _imgProfile != null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(
                                  baseImageURL + 'profile/' + _imgProfile!),
                            )
                          : CircularProgressIndicator(),
                    ],
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                    title: Text(
                      'Info',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    onTap: () {
                      // close drawer
                      Navigator.pop(context);
                      // navigate to info screen
                      Navigator.pushNamed(context, '/info');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                    title: Text(
                      'About',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    onTap: () {
                      // close drawer
                      Navigator.pop(context);
                      // navigate to about screen
                      Navigator.pushNamed(context, '/about');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                    title: Text(
                      'Contact',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    onTap: () {
                      // close drawer
                      Navigator.pop(context);
                      // navigate to contact screen
                      Navigator.pushNamed(context, '/contact');
                    },
                  ),
                ],
              ),
              Expanded(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ListTile(
                    leading: Icon(Icons.logout_outlined),
                    visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                    title: Text(
                      'Logout',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    onTap: logout,
                  ),
                ],
              ))
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabChange,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryDark,
          unselectedItemColor: secondaryText,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart_outlined),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Setting',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ));
  }
}
