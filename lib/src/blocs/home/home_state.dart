part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeProgressState extends HomeState {}

class PostUploadPhotoUrlState extends HomeState {
  String imgUrl;
  PostUploadPhotoUrlState(this.imgUrl);
}

class HomeCreatePostDoneState extends HomeState {
  String message;
  HomeCreatePostDoneState(this.message);
}

class HomePostsState extends HomeState {
  List<Posts> posts;
  HomePostsState(this.posts);
}

class HomeFailedState extends HomeState {
  String message;
  HomeFailedState(this.message);
}
