// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_scale/models/ProductModel.dart';
import 'package:flutter_scale/screens/tabbarmenu/product_item_list.dart';
import 'package:flutter_scale/services/rest_api.dart';
import 'package:flutter_scale/themes/colors.dart';

var refreshKey = GlobalKey<RefreshIndicatorState>();

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: () async {
        setState(() {});
      },
      child: Scaffold(
        body: FutureBuilder(
          future: CallAPI().getAllProducts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('เกิดข้อผิดพลาดในการโหลดข้อมูล'), // แสดงข้อความเมื่อเกิด Error
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<ProductModel> products = snapshot.data;
              return ProductItemList(products); // แสดงข้อมูล
            } else {
              return Center(
                child: CircularProgressIndicator(), // แสดง Loading
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addproduct');
          },
          child: Icon(Icons.add, color: icons),
          backgroundColor: buttonadd,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
