// ignore_for_file: prefer_const_constructors, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_scale/models/ProductModel.dart';
import 'package:flutter_scale/screens/tabbarmenu/products_screen.dart';
import 'package:flutter_scale/services/rest_api.dart';

Widget ProductItemList(List<ProductModel> products) {
  return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      itemBuilder: (context, index) {
        ProductModel productModel = products[index];
        return Card(
          child: Column(
            children: [
              
              Image.network(
                productModel.productImage,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return Image.asset('assets/images/noimgs.jpg');
                },
              ),
              
              ListTile(
                title: Text(productModel.productName),
                subtitle: Text(productModel.productBarcode),
              ),
              ButtonBar(
                children: [
                  ElevatedButton(
                    child: Text('Edit'),
                    onPressed: () {
                      Navigator.pushNamed(
                        context, '/editproduct', 
                        arguments: {'products': productModel.toJson()}
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      return showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirm Delete'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: const <Widget>[
                                Text('Are you sure to delete this product?'),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Delete'),
                              onPressed: () async {
                                var response = await CallAPI().deleteProduct(productModel.id.toString());
                                if(response){
                                  Navigator.of(context).pop();
                                  refreshKey.currentState!.show();
                                }
                              },
                            ),
                          ],
                        );
                      }
                    );
                    },
                    child: Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
