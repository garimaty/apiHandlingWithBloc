import 'dart:convert';
import 'dart:math';

import 'package:api_handling_with_bloc/data/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PostRepository{

final dio = Dio();

Future<List<PostModel>> fetchPosts() async{
     try{
       final response = await dio.get("https://jsonplaceholder.typicode.com/todos");
       print(response.data);
       dio.interceptors.add(PrettyDioLogger());
        List<dynamic> list = response.data;
       return list.map((element) => PostModel.fromJson(element)).toList();
     }catch(e){
      throw Exception(e);
     }

  }
}