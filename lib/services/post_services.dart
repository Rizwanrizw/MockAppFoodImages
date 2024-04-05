import 'dart:convert';

import 'package:clone_app/api/urls.dart';
import 'package:clone_app/error/api_error.dart';
import 'package:clone_app/model/post_model.dart';
import 'package:http/http.dart' as http ;


class PostServices {

  final client = http.Client();

  Future<PostModel> getImages() async {
      final response = await client.get(Uri.parse("${API().baseUrl}?q=chicken soup"), headers: {"X-RapidAPI-Key": "fc99c975famsha7591eca96eaaf8p1ac426jsne0a5c084fd81"}, );
      print("Response: ${response.statusCode}");
      if(response.statusCode == 200){
        final dynamic responseBody = jsonDecode(response.body);
        PostModel post = PostModel.fromJson(responseBody);
        return post;
      } throw ApiError(
        message: "Error Occurred"
      );
  }

}
