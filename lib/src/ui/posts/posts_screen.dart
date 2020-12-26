import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/src/assets/styles/app_widget_size.dart';
import 'package:flutter_social_media_app/src/constants/app_text_constants.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({Key key}) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
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
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: AppWidgetSize.dimen_16),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) =>
                  _buildPostWidget(index),
            ),
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

  _buildPostWidget(int index) {
    return Card(
      margin: EdgeInsets.only(top: index == 0 ? 0 : AppWidgetSize.dimen_24),
      elevation: 3,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            'https://placeimg.com/640/480/any',
            height: AppWidgetSize.getSize(250),
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.all(AppWidgetSize.dimen_8),
            child: Text(
              'Scarface: The Movie',
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
                    text:
                        ' https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&',
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
              'Scarface is a 1983 American crime drama film directed by Brian De Palma and written by Oliver Stone. The remake of the 1932 film, it tells the story of Cuban refugee Tony Montana (Al Pacino), who arrives penniless in 1980s Miami but would go on to become a powerful drug lord.',
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
