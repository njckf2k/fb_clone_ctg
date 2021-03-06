import 'package:fb_clone_ctg/config/app_color.dart';
import 'package:fb_clone_ctg/constant/route_constant.dart';
import 'package:fb_clone_ctg/module/friend/all_fr_view.dart';
import 'package:fb_clone_ctg/module/home_page/home_view.dart';
import 'package:fb_clone_ctg/module/post/add_post/add_post_view.dart';
import 'package:fb_clone_ctg/module/post/post_view.dart';
import 'package:fb_clone_ctg/module/profile/profile_view.dart';
import 'package:fb_clone_ctg/module/setting/setting_information/changing_password_view.dart';
import 'package:fb_clone_ctg/module/setting/setting_information/setting_information_view.dart';
import 'package:fb_clone_ctg/module/setting/setting_view.dart';
import 'package:fb_clone_ctg/module/sign_up/change_info/change_info_view.dart';
import 'package:fb_clone_ctg/module/videos/videos_view.dart';

// import 'package:fb_clone_ctg/module/profile/profile_view.dart';

import 'package:fb_clone_ctg/module/sign_in/sign_in_view.dart';
import 'package:fb_clone_ctg/module/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';
import '../constant/route_constant.dart';
import '../module/notification/notification_view.dart';
import '../module/friend/requested_fr_view.dart';

Map<String, WidgetBuilder> routeConfig() {
  return <String, WidgetBuilder>{
    RouteConstant.SIGN_IN: (context) => SignInPage(),
    RouteConstant.NOTIFICATIONS: (context) => NotificationPage(),
    RouteConstant.HOME: (context) => HomePage(),
    RouteConstant.ADD_POST: (context) => AddPostPage(),
    RouteConstant.SETTING: (context) => SettingPage(),
    RouteConstant.VIDEO: (context) => VideosPage(),
    RouteConstant.SETTING_INFO: (context) =>  SettingInformationPage(),
    RouteConstant.CHANGE_PASSWORD: (context) => ChangingPasswordPage(),
    RouteConstant.PROFILE: (context) => ProfilePage(),
    RouteConstant.SIGN_UP: (context) => SignUpPage(),
    RouteConstant.CHANGE_INFO: (context) => ChangeInfoPage(),
    RouteConstant.POST_DETAIL: (context) => PostDetailPage(),
    RouteConstant.GET_USER_FRIENDS: (context) => AllFriendPage(),
    RouteConstant.REQUESTED_FRIEND: (context) => RequestedPage(),
  };
}
