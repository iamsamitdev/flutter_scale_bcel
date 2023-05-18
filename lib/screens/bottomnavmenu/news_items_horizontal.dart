// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_scale/models/NewsModel.dart';

Widget newsItemHorizontalList(List<NewsModel> news) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: news.length,
    itemBuilder: (context, index) {
      NewsModel newsModel = news[index];

      return Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/newsdetail',
                arguments: {'news': newsModel.toJson()});
          },
          child: Card(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(newsModel.imageurl),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          newsModel.topic,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          newsModel.detail,
                          style: TextStyle(fontSize: 16.0),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
