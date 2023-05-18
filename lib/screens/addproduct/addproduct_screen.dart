// ignore_for_file: prefer_const_constructors, unused_field, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_scale/components/custom_widgets.dart';
import 'package:flutter_scale/models/ProductModel.dart';
import 'package:flutter_scale/screens/tabbarmenu/products_screen.dart';
import 'package:flutter_scale/services/rest_api.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  final _formKey = GlobalKey<FormState>();

  // ตัวแปรสำหรับเก็บค่าจากฟอร์ม
  String? _productName, _productDetail, _productBarcode, _productPrice, _productQty, _productImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มรายการสินค้า'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: ListView(
            children: [
              CustomTextField(
                context, 
                'Product name', 
                (onValidateVal){
                  if(onValidateVal!.isEmpty){
                    return 'กรุณากรอกชื่อสินค้า';
                  }else{
                    return null;
                  }
                }, 
                (onSaveVal){
                  _productName = onSaveVal;
                }
              ),
              SizedBox(height: 10),
              CustomTextField(
                context, 
                'Detail', 
                (onValidateVal){
                  if(onValidateVal!.isEmpty){
                    return 'กรุณากรอกรายละเอียดสินค้า';
                  }else{
                    return null;
                  }
                }, 
                (onSaveVal){
                  _productDetail = onSaveVal;
                }
              ),
              SizedBox(height: 10),
              CustomTextField(
                context, 
                'Barcode', 
                (onValidateVal){
                  if(onValidateVal!.isEmpty){
                    return 'กรุณากรอกบาร์โค้ดสินค้า';
                  }else{
                    return null;
                  }
                }, 
                (onSaveVal){
                  _productBarcode = onSaveVal;
                }
              ),
              SizedBox(height: 10),
              CustomTextField(
                context, 
                'Price', 
                (onValidateVal){
                  if(onValidateVal!.isEmpty){
                    return 'กรุณากรอกราคาสินค้า';
                  }else{
                    return null;
                  }
                }, 
                (onSaveVal){
                  _productPrice = onSaveVal;
                }
              ),
              SizedBox(height: 10),
              CustomTextField(
                context, 
                'Qty', 
                (onValidateVal){
                  if(onValidateVal!.isEmpty){
                    return 'กรุณากรอกจำนวนสินค้า';
                  }else{
                    return null;
                  }
                }, 
                (onSaveVal){
                  _productQty = onSaveVal;
                }
              ),
              SizedBox(height: 10),
              CustomTextField(
                context, 
                'Image', 
                (onValidateVal){
                  if(onValidateVal!.isEmpty){
                    return 'กรุณากรอกชื่อรูปภาพสินค้า';
                  }else{
                    return null;
                  }
                }, 
                (onSaveVal){
                  _productImage = onSaveVal;
                }
              ),
              SizedBox(height: 10),
              CustomButton(
                () async {
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();

                    // Call API
                    ProductModel productModel = ProductModel(
                      productName: _productName.toString(),
                      productDetail: _productDetail.toString(),
                      productBarcode: _productBarcode.toString(),
                      productPrice: _productPrice.toString(),
                      productQty: _productQty.toString(),
                      productImage: _productImage.toString(),
                    );

                    var response = await CallAPI().addProduct(productModel);

                    // print(response);

                    if(response){
                      // ส่งค่ากลับไปหน้า product
                      Navigator.pop(context, true);
                      // refresh หน้า product
                      refreshKey.currentState!.show();

                    }else{
                      // แจ้งเตือน
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('เกิดข้อผิดพลาดในการบันทึกรายการสินค้า'),
                        )
                      );
                    }

                  }
                }, 
                'บันทึกรายการ', 
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ],
          ),
        )
      ),
    );
  }
}