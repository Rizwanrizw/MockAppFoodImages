import 'package:clone_app/error/api_error.dart';
import 'package:clone_app/screen/bloc/home_events.dart';
import 'package:clone_app/screen/bloc/home_states.dart';
import 'package:clone_app/services/post_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeBloc() : super(GetImagesLoading()) {
    on<GetImages>((event, emit) async {
      try {
        emit(GetImagesLoading());
        final imagesData = await PostServices().getImages();
        emit(GetImagesSuccess(imageDataList: imagesData.d!));
      } catch(e) {
        if(e is ApiError) {
          emit(GetImagesFailure(error: e));
        }
      }
    });
  }
}