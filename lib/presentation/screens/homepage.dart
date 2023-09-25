import 'package:api_handling_with_bloc/logic/cubits/post_cubit/post_cubit.dart';
import 'package:api_handling_with_bloc/logic/cubits/post_cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Handling Using Bloc"),
      ),
      body: SafeArea(
        child: BlocBuilder<PostCubit,PostState>(
          builder: (context,state) {
           if(state is PostLoadingState){
             return const Center(
               child: CircularProgressIndicator(),
             );
           }else if(state is PostLoadedState){
             return ListView.builder(
               itemCount: state.posts.length,
                 itemBuilder:(context , index){
                 return ListTile(
                   leading: Text(state.posts[index].id.toString()),
                   title: Text(state.posts[index].title.toString()),
                 );
                 }
             );
           }else{
             return const Center(child: Text("Error Occurred!"));
           }
          }
        )
      ),
    );
  }
}
