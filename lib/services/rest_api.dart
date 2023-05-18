// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, use_build_context_synchronously, unnecessary_null_comparison

import 'dart:convert';
import 'package:flutter_scale/models/NewsModel.dart';
import 'package:flutter_scale/models/ProductModel.dart';
import 'package:flutter_scale/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../utils/utility.dart';

class CallAPI {
  // Set Header
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  // Login API Call Method
  loginAPI(data) async {
    // Check Network Connection
    if (await checkNetwork() == '') {
      return http.Response(
        jsonEncode({
          "status": "error",
          "message": "No Internet Connection",
        }),
        200,
      );
    } else {
      return await http.post(
        Uri.parse(baseURLAPI + 'login'),
        body: jsonEncode(data),
        headers: _setHeaders(),
      );
    }
  }

  // Read Last News API Call Method
  Future<List<NewsModel>?> getLastNews() async {
    // Check Network Connection
    if (await checkNetwork() == '') {
      return null;
    } else {
      final response = await http.get(
        Uri.parse(baseURLAPI + 'lastnews'),
        headers: _setHeaders(),
      );
      if(response.body != null){
        return newsModelFromJson(response.body);
      }else{
        return null;
      }
    }
  }

  // Read All News API Call Method
  Future<List<NewsModel>?> getAllNews() async {
    // Check Network Connection
    if (await checkNetwork() == '') {
      return null;
    } else {
      final response = await http.get(
        Uri.parse(baseURLAPI + 'news'),
        headers: _setHeaders(),
      );
      if(response.body != null){
        return newsModelFromJson(response.body);
      }else{
        return null;
      }
    }
  }

  // ----------------------------------------
  // CRUD Product API Call Method
  // ----------------------------------------

  // Get All Products API Call Method
  Future<List<ProductModel>?> getAllProducts() async {
    // Check Network Connection
    if (await checkNetwork() == '') {
      return null;
    } else {
      final response = await http.get(
        Uri.parse(baseURLAPI + 'products'),
        headers: _setHeaders(),
      );
      if(response.body != null){
        return productModelFromJson(response.body);
      }else{
        return null;
      }
    }
  }

  // Get Product By ID API Call Method
  Future<ProductModel?> getProductByID(id) async {
    // Check Network Connection
    if (await checkNetwork() == '') {
      return null;
    } else {
      final response = await http.get(
        Uri.parse(baseURLAPI + 'products/' + id.toString()),
        headers: _setHeaders(),
      );
      if(response.body != null){
        return ProductModel.fromJson(jsonDecode(response.body));
      }else{
        return null;
      }
    }
  }

  // Add Product API Call Method
  Future<bool> addProduct(ProductModel data) async {
    // Check Network Connection
    if (await checkNetwork() == '') {
      return false;
    } else {
      final response = await http.post(
        Uri.parse(baseURLAPI + 'products'),
        body: productModelToJson(data),
        headers: _setHeaders(),
      );
      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
    }
  }

  // Update Product API Call Method
  Future<bool> updateProduct(ProductModel data) async {
    // Check Network Connection
    if (await checkNetwork() == '') {
      return false;
    } else {
      final response = await http.put(
        Uri.parse(baseURLAPI + 'products/${data.id}'),
        body: productModelToJson(data),
        headers: _setHeaders(),
      );
      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
    }
  }

  // Delete Product API Call Method
  Future<bool> deleteProduct(String id) async {
    // Check Network Connection
    if (await checkNetwork() == '') {
      return false;
    } else {
      final response = await http.delete(
        Uri.parse(baseURLAPI + 'products/$id'),
        headers: _setHeaders(),
      );
      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
    }
  }
  
}
