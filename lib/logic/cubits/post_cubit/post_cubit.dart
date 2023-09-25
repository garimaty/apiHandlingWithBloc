import 'package:api_handling_with_bloc/data/models/post_model.dart';
import 'package:api_handling_with_bloc/data/repository/post_repository.dart';
import 'package:api_handling_with_bloc/logic/cubits/post_cubit/post_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState>{
 PostCubit() : super(PostLoadingState()){
   fetchData();
 }

 PostRepository postRepository = PostRepository();

 void fetchData() async{
   try{
     List<PostModel> post=await postRepository.fetchPosts();
     emit(PostLoadedState(post));
   }catch(e){
     emit(PostErrorState(e.toString()));
   }
 }
}