import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/src/assets/styles/app_widget_size.dart';
import 'package:flutter_social_media_app/src/blocs/home/home_bloc.dart';
import 'package:flutter_social_media_app/src/constants/app_text_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_app/src/models/post/post_response_model.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({Key key}) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  HomeBloc homeBloc;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeBloc = BlocProvider.of<HomeBloc>(context);
      homeBloc.add(HomeFetchPostEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buidBody(),
    );
  }

  _buidBody() {
    double topHeight = MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.only(top: topHeight),
      padding: EdgeInsets.symmetric(horizontal: AppWidgetSize.bodyPadding),
      child: Column(
        children: [
          _buildHeading(),
          BlocBuilder<HomeBloc, HomeState>(
            condition: (prevState, state) => state is HomePostsState,
            builder: (context, state) {
              print('state $state');
              if (state is HomePostsState) {
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: AppWidgetSize.dimen_16),
                    itemCount: state.posts.length,
                    itemBuilder: (BuildContext context, int index) =>
                        _buildPostWidget(state.posts[index], index),
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }

  Padding _buildHeading() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppWidgetSize.dimen_20),
      child: Row(
        children: [
          Text(
            AppTextConstants.POSTS + '   ',
            style: Theme.of(context)
                .primaryTextTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Divider(),
          )
        ],
      ),
    );
  }

  _buildPostWidget(Posts post, int index) {
    return Card(
      margin: EdgeInsets.only(top: index == 0 ? 0 : AppWidgetSize.dimen_24),
      elevation: 3,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          post.images.isNotEmpty
              ? FadeInImage.assetNetwork(
                  height: AppWidgetSize.getSize(250),
                  placeholder: 'lib/src/assets/images/app_logo.png',
                  image: post.images[0],
                )
              : Image.network(
                  'https://placeimg.com/640/480/any',
                  height: AppWidgetSize.getSize(250),
                  fit: BoxFit.fill,
                ),
          Padding(
            padding: EdgeInsets.all(AppWidgetSize.dimen_8),
            child: Text(
              post.heading,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: AppWidgetSize.dimen_20,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppWidgetSize.dimen_8,
            ),
            child: RichText(
              text: TextSpan(
                text: 'Link: ',
                style: Theme.of(context).textTheme.headline4,
                children: <TextSpan>[
                  TextSpan(
                    text: ' ' + post.link,
                    style: Theme.of(context).primaryTextTheme.headline3,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppWidgetSize.dimen_8,
                vertical: AppWidgetSize.dimen_10),
            child: Text(
              post.text,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
