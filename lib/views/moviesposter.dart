import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/postercontroller.dart';

class MoviesPoster extends StatelessWidget {
  final PosterController imageController = Get.put(PosterController()); // instantiate controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        centerTitle: true,
        title: Text('Movies Poster'),
      ),
      body: Obx(() => Column(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageController.shows.length,
            itemBuilder: (context, index) {
              var show = imageController.shows[index];
              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 300,
                        child: Image.network(show.thumbnailUrl, fit: BoxFit.fill,),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    show.thumbnailUrl,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 150,
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: imageController.shows.length,
            itemBuilder: (context, index) {
              var show = imageController.shows[index];
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  height: 30,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Text(
                    show.name,textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ],
        ) ),
    );
  }
}