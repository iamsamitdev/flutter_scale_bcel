// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_scale/models/NewsModel.dart';

Widget NewsItemVerticalList(List<NewsModel> news) {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: news.length,
    itemBuilder: (context, index) {
      NewsModel newsModel = news[index];
      return ListTile(
        onTap: (){
          Navigator.pushNamed(
            context, 
            '/newsdetail',
            arguments: {'news': newsModel.toJson()}
          );
        },
        leading: Image.network(newsModel.imageurl),
        title: Text(
          newsModel.topic,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          newsModel.detail,
          overflow: TextOverflow.ellipsis,
        ),
      );
    },
  );
}
