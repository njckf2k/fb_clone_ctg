import 'package:fb_clone_ctg/constant/route_constant.dart';
import 'package:fb_clone_ctg/module/home_page/add_post/add_post_bloc.dart';
import 'package:fb_clone_ctg/module/home_page/add_post/add_post_view.dart';
import 'package:fb_clone_ctg/module/home_page/home_view.dart';
import 'package:fb_clone_ctg/module/sign_in/sign_in_view.dart';
import 'package:flutter/material.dart';

import '../constant/route_constant.dart';
import '../constant/route_constant.dart';
import '../constant/route_constant.dart';
import '../shared/widgets/notification_view.dart';

Map<String, WidgetBuilder> routeConfig() {
  return <String, WidgetBuilder>{
    RouteConstant.SIGN_IN: (context) => SignInPage(),
    RouteConstant.NOTIFICATIONS: (context) => NotificationPage(),
    RouteConstant.HOME: (context) => HomePage(),
    RouteConstant.ADD_FRIEND: (context) => HomePage(),
    RouteConstant.ADD_POST: (context) => AddPostPage(),
    RouteConstant.VIDEO: (context) => HomePage()
  };
}
