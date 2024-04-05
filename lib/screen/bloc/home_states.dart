import 'package:clone_app/error/api_error.dart';
import 'package:clone_app/model/post_model.dart';
import 'package:equatable/equatable.dart';

class HomeStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetImagesLoading extends HomeStates {

}

class GetImagesSuccess extends HomeStates {
  final List<D> imageDataList;

  GetImagesSuccess({required this.imageDataList});

  @override
  List<Object?> get props => [imageDataList];
}

class GetImagesFailure extends HomeStates {
  final ApiError error;
  
  GetImagesFailure({required this.error});

  @override
  List<Object?> get props => [error];
}