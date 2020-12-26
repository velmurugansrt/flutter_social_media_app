part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeCreatePostEvent extends HomeEvent {
  Map payload;
  HomeCreatePostEvent(this.payload);
}

class HomeFetchPostEvent extends HomeEvent {}

class HomeUploadImageEvent extends HomeEvent {
  String path;
  HomeUploadImageEvent(this.path);
}
