// Check network connection
import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// Check network connection
Future<String> checkNetwork() async {
  var checkNetwork = await Connectivity().checkConnectivity();

  if(checkNetwork == ConnectivityResult.mobile){
    return 'mobile';
  }else if(checkNetwork == ConnectivityResult.wifi){
    return 'wifi';
  }else if(checkNetwork == ConnectivityResult.ethernet){
    return 'ethernet';
  }else if(checkNetwork == ConnectivityResult.bluetooth){
    return 'bluetooth';
  }else if(checkNetwork == ConnectivityResult.none){
    return '';
  }

  return '';
}