import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/album_model.dart';

class PosterController extends GetxController  with StateMixin{
  var shows = [].obs;
  var isLoading = true.obs;

  Widget loaderWidget(){
    return obx(
        (state) => const SizedBox(),
      onLoading: Positioned.fill(child: Container(
        color: Colors.black45,
        child: Center(child: CircularProgressIndicator()),
      ))
    );
  }

  @override
  void onInit() {
    fetchShows();
    super.onInit();
  }

  void fetchShows() async {
    var url = 'https://www.episodate.com/api/most-popular?page=1';
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);
    shows.assignAll(data['tv_shows'].map((show) => ShowModel.fromJson(show)).toList());
  }
}