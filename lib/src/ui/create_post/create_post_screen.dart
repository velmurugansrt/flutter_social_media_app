import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/src/assets/app_images.dart';
import 'package:flutter_social_media_app/src/assets/styles/app_widget_size.dart';
import 'package:flutter_social_media_app/src/blocs/home/home_bloc.dart';
import 'package:flutter_social_media_app/src/constants/app_constants.dart';
import 'package:flutter_social_media_app/src/constants/app_text_constants.dart';
import 'package:flutter_social_media_app/src/data/store/app_store.dart';
import 'package:flutter_social_media_app/src/data/validator/input_validator.dart';
import 'package:flutter_social_media_app/src/ui/screen/base/base_screen.dart';
import 'package:flutter_social_media_app/src/ui/widgets/circular_button_toggle_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostScreen extends BaseScreen {
  CreatePostScreen({Key key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends BaseScreenState<CreatePostScreen> {
  String targetValue = AppConstants.TOGGLE_BUTTON_LIST[0];
  final ImagePicker _picker = ImagePicker();
  TextEditingController _headingController = TextEditingController();
  TextEditingController _promoteController = TextEditingController();
  TextEditingController _linkController = TextEditingController();
  List images = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  HomeBloc homeBloc;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeBloc = BlocProvider.of<HomeBloc>(context);
      homeBloc.listen(homeBlocListener);
    });
    super.initState();
  }

  void homeBlocListener(state) {
    if (state is PostUploadPhotoUrlState) {
      images.add(state.imgUrl);
    } else if (state is HomeCreatePostDoneState) {
      showSnackAlert(state.message);
      _headingController.text = '';
      _promoteController.text = '';
      _linkController.text = '';

      setState(() {
        images = [];
        targetValue = AppConstants.TOGGLE_BUTTON_LIST[0];
      });
    }
  }

  _imgPicker(type) async {
    PickedFile pickedFile = await _picker.getImage(source: type);
    if (pickedFile != null) {
      homeBloc.add(HomeUploadImageEvent(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    double topHeight = MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.only(top: topHeight),
      padding: EdgeInsets.symmetric(horizontal: AppWidgetSize.bodyPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeading(),
            _buildHeadingInputWrap(),
            Divider(),
            _buildProfileInputWrap(),
            _buildUploadMediaWrap(),
            Divider(),
            _buildTargetWrap(),
            _buildPostButtonWrap(),
          ],
        ),
      ),
    );
  }

  Padding _buildHeading() {
    return Padding(
      padding: EdgeInsets.only(top: AppWidgetSize.dimen_20),
      child: Row(
        children: [
          Text(
            AppTextConstants.CREATE_POST + '   ',
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

  Padding _buildHeadingInputWrap() {
    return Padding(
      padding: EdgeInsets.only(top: AppWidgetSize.dimen_24),
      child: Row(
        children: [
          AppImages.speakerIcon,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppWidgetSize.dimen_12),
              child: TextField(
                controller: _headingController,
                inputFormatters: InputValidator.maxLength(60),
                onChanged: (data) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'heading …',
                ),
                // maxLength: 60,
              ),
            ),
          ),
          Text(
            _headingController.text.length.toString() + '/60',
            style: Theme.of(context).textTheme.headline3,
          )
        ],
      ),
    );
  }

  Padding _buildProfileInputWrap() {
    return Padding(
      padding: EdgeInsets.only(top: AppWidgetSize.dimen_8),
      child: Column(
        // direction: Axis.vertical,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppWidgetSize.dimen_20),
                child: SizedBox(
                  width: AppWidgetSize.dimen_40,
                  height: AppWidgetSize.dimen_40,
                  child: Image(
                    image: NetworkImage(
                      AppStore().getUserDetails().photoURL,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppWidgetSize.dimen_12),
                  child: Text(
                    AppStore().getUserDetails().displayName,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Text(
                _promoteController.text.length.toString() + '/150',
                style: Theme.of(context).textTheme.headline3,
              )
            ],
          ),
          TextField(
            controller: _promoteController,
            inputFormatters: InputValidator.maxLength(150),
            onChanged: (data) => setState(() {}),
            maxLines: 20,
            decoration: InputDecoration(
              hintText: 'Promote yourself …',
            ),
          )
        ],
      ),
    );
  }

  Padding _buildUploadMediaWrap() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppWidgetSize.dimen_10,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _imgPicker(ImageSource.gallery),
            child: AppImages.galleryIcon,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppWidgetSize.dimen_16,
            ),
            child: GestureDetector(
              onTap: () => _imgPicker(ImageSource.camera),
              child: AppImages.camaraIcon,
            ),
          ),
          Expanded(
            child: Container(
              height: AppWidgetSize.dimen_35,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: new BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 1.0, spreadRadius: 0.1)
                ],
              ),
              child: TextField(
                controller: _linkController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Your link here...',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _buildTargetWrap() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppWidgetSize.dimen_20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppTextConstants.SELECT_TARGET,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(top: AppWidgetSize.dimen_10),
            child: CircularButtonToggleWidget(
              toggleButtonlist: AppConstants.TOGGLE_BUTTON_LIST,
              toggleButtonOnChanged: _toggleButtonOnChanged,
              value: targetValue,
            ),
          )
        ],
      ),
    );
  }

  _toggleButtonOnChanged(String data) {
    setState(() {
      targetValue = data;
    });
  }

  _buildPostButtonWrap() {
    return Padding(
      padding: EdgeInsets.only(bottom: AppWidgetSize.dimen_20),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: RaisedButton(
          padding: EdgeInsets.symmetric(
            vertical: AppWidgetSize.dimen_12,
          ),
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: AppWidgetSize.buttonBorderRadius,
          ),
          onPressed: _postButtonPressed,
          child: Text(
            AppTextConstants.POST,
            style: Theme.of(context)
                .accentTextTheme
                .headline4
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _postButtonPressed() {
    String headingText = _headingController.text.trim();
    String promoteText = _promoteController.text.trim();
    String linkText = _linkController.text.trim();
    if (headingText == '') {
      showSnackAlert(AppTextConstants.HEADING_ERROR);
    } else if (promoteText == '') {
      showSnackAlert(AppTextConstants.PROMOTE_ERROR);
    } else if (linkText == '') {
      showSnackAlert(AppTextConstants.LINK_ERROR);
    } else {
      Map payload = {
        'heading': headingText,
        'text': promoteText,
        'images': images,
        'link': linkText,
        'target': targetValue,
        'type': 'announcment'
      };
      homeBloc.add(HomeCreatePostEvent(payload));
    }
  }

  showSnackAlert(msg) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: AppConstants.snackBarDuration,
        content: Text(
          msg,
          style: Theme.of(context).accentTextTheme.headline2,
        ),
      ),
    );
  }
}
