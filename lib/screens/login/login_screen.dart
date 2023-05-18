// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_scale/components/custom_widgets.dart';
import 'package:flutter_scale/services/rest_api.dart';
import 'package:flutter_scale/themes/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // สร้าง key ไว้ผูกกับฟอร์ม
  final formKey = GlobalKey<FormState>();

  // สร้างตัวแปร ไว้เก็บค่า username และ password
  late String _username, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 180),
                    Image.asset('assets/images/logoapp.png', height: 100),
                    const SizedBox(height: 40),
                    SizedBox(
                        width: 250,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'กรุณากรอกชื่อผู้ใช้งาน';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            _username = value!.toString().trim();
                          },
                        )),
                    const SizedBox(height: 20),
                    SizedBox(
                        width: 250,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'กรุณากรอกรหัสผ่าน';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            _password = value!.toString().trim();
                          },
                        )),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 250.0,
                      child: CustomButton(
                        () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                              // Call login API
                              var response = await CallAPI().loginAPI(
                                {
                                  'username': _username, 
                                  'password': _password
                                }
                              );

                              var body = jsonDecode(response.body);

                              // print(body);

                              if (body['status'] == 'success') {

                                // create shared preference object
                                SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

                                // save data to shared preference
                                sharedPreferences.setString('userID', body['data']['id']);
                                sharedPreferences.setString('userName', body['data']['username']);
                                sharedPreferences.setString('fullName', body['data']['fullname']);
                                sharedPreferences.setString('imgProfile', body['data']['img_profile']);

                                // ส่งไปหน้า dashboard
                                Navigator.pushReplacementNamed(context, '/dashboard');
                                
                              } else {
                                // แจ้งเตือน
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Center(
                                      child: Text(body['message'],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                          }
                        }, 
                        'เข้าสู่ระบบ',
                        color: primaryDark,
                        textColor: primaryLight
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
