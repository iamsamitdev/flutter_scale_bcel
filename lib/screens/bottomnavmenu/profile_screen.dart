// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale/provider/app_locale.dart';
import 'package:flutter_scale/provider/theme_notifier.dart';
import 'package:flutter_scale/themes/colors.dart';
import 'package:flutter_scale/themes/style.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  // Create instance of AppLocale
  late AppLocale _appLocale;

  bool _darkTheme = false;

  @override
  void didChangeDependencies() {
    _appLocale = Provider.of<AppLocale>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    // Switch theme
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == AppTheme.darkTheme);

    void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
      (value)
      ? themeNotifier.setTheme(AppTheme.darkTheme)
      : themeNotifier.setTheme(AppTheme.lightTheme);
    }

    return Scaffold(
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: primaryDark
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/samitkk.jpg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Samit Koyom',
                      style: TextStyle(
                        fontSize: 20,
                        color: icons
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Administrator',
                      style: TextStyle(
                        fontSize: 16,
                        color: icons
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(AppLocalizations.of(context)!.menu_account),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.password),
                title: Text(AppLocalizations.of(context)!.menu_changepass),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text(AppLocalizations.of(context)!.menu_changelang),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  // Create alert dialog select language
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Select language'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              InkWell(
                                child: Text('English'),
                                onTap: (){
                                  Navigator.of(context).pop();
                                  _appLocale.changeLocale(Locale('en'));
                                },
                              ),
                              Padding(padding: EdgeInsets.all(8.0)),
                              InkWell(
                                child: Text('ไทย'),
                                onTap: (){
                                  Navigator.of(context).pop();
                                  _appLocale.changeLocale(Locale('th'));
                                },
                              ),
                              Padding(padding: EdgeInsets.all(8.0)),
                              InkWell(
                                child: Text('ລາວ'),
                                onTap: (){
                                  Navigator.of(context).pop();
                                  _appLocale.changeLocale(Locale('lo'));
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(AppLocalizations.of(context)!.menu_setting),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text(AppLocalizations.of(context)!.menu_contact),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(AppLocalizations.of(context)!.menu_logout),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){},
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform.scale(
                  scale: 0.3,
                  child: DayNightSwitch(
                    value: _darkTheme, 
                    // moonImage: const AssetImage('assets/images/moon.png'),
                    onChanged: (val){
                      setState(() {
                        _darkTheme = val;
                      });
                      onThemeChanged(val, themeNotifier);
                    },
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}