import 'package:api_handling_with_bloc/data/models/post_model.dart';
import 'package:api_handling_with_bloc/data/repository/post_repository.dart';
import 'package:api_handling_with_bloc/logic/cubits/post_cubit/post_cubit.dart';
import 'package:api_handling_with_bloc/presentation/screens/homepage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


 Future<void> main() async {
   PostRepository postRepository = PostRepository();
  List<PostModel> postModel= await postRepository.fetchPosts();
  print(postModel.toString());
   runApp(const MyApp());
 }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> PostCubit(),
     child: const MaterialApp(
          home: MyHomePage(),
        )
    );
  }
}
