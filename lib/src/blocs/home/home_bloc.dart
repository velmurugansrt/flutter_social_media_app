import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_social_media_app/src/data/repository/posts/posts_repository.dart';
import 'package:flutter_social_media_app/src/models/common/upload_response_model.dart';
import 'package:flutter_social_media_app/src/models/post/create_post_response_mode.dart';
import 'package:flutter_social_media_app/src/models/post/post_response_model.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeInitialState get initialState => HomeInitialState();
  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeFetchPostEvent) {
      yield* _handleHomeFetchPostEvent(event);
    } else if (event is HomeCreatePostEvent) {
      yield* _handleHomeCreatePostEvent(event);
    } else if (event is HomeUploadImageEvent) {
      yield* _handleHomeUploadImageEvent(event);
    }
  }

  Stream<HomeState> _handleHomeFetchPostEvent(HomeFetchPostEvent event) async* {
    yield HomeProgressState();
    PostResponseModel postResponseModel =
        await PostsRepository().fetchRequest();
    if (postResponseModel.isSuccess()) {
      yield HomePostsState(postResponseModel.posts);
    } else {
      yield HomeFailedState(postResponseModel.message);
    }
  }

  Stream<HomeState> _handleHomeCreatePostEvent(
      HomeCreatePostEvent event) async* {
    yield HomeProgressState();
    CreatePostResponseModel postResponseModel =
        await PostsRepository().createPost(event.payload);
    if (postResponseModel.isSuccess()) {
      yield HomeCreatePostDoneState(postResponseModel.message);
    } else {
      yield HomeFailedState(postResponseModel.message);
    }
  }

  Stream<HomeState> _handleHomeUploadImageEvent(
      HomeUploadImageEvent event) async* {
    yield HomeProgressState();
    UploadResponseModel uploadResponseModel =
        await PostsRepository().uploadPhoto(event.path);
    if (uploadResponseModel.isSuccess()) {
      yield PostUploadPhotoUrlState(uploadResponseModel.imageUrl);
    } else {
      yield HomeFailedState(uploadResponseModel.message);
    }
  }
}
