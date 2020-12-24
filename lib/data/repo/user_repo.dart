import 'package:fb_clone_ctg/constant/spref_constant.dart';
import 'package:fb_clone_ctg/data/service/user_service.dart';
import 'package:fb_clone_ctg/shared/entities/login_result.dart';
import 'package:fb_clone_ctg/untils/spref_util.dart';
import 'package:flutter/material.dart';

abstract class ISignInListener {
  onSignInSuccess(LoginResult loginResult);

  onCheckSignInSuccess(DataForLogin dataForLogin);

  onSignInFailed(String resCode);
}

class UserRepo {
  UserService _userService;

  UserRepo({@required UserService userService})
      : this._userService = userService;

  void signIn(String phoneNumber, String password, ISignInListener listener) async {
    LoginResult loginResult;
    // UserData userData = UserData(avatar: null, displayName: 'aaaa', token: '92839189');
    // signInListener.onSignInSuccess(userData);
    SpUtil.getInstance();
    var futureRes = await _userService.signIn(phoneNumber, password).then((
        res) async {
      loginResult = LoginResult.fromJson(res.data);
      if (loginResult.code != "1000") {
        listener.onSignInFailed(loginResult.code);
        return;
      }
      print("User actived!");
    }).catchError((error) => print("login err: " + error.toString()));
    // futureRes.then((res) async {
    //   LoginResult userData = LoginResult.fromJson(res.data);
    //   print("IsActive: ${userData.isActive}");
    //   if (!userData.success) {
    //     signInListener.onSignInFailed(RestError(message: userData.message));
    //     return;
    //   }
    //   if (userData.userType == UserTypeEnum.ADMIN) {
    //     signInListener
    //         .onSignInFailed(RestError(message: "Tài khoản không khả dụng."));
    //     return;
    //   }
    DataForLogin userData = loginResult.data;
    SpUtil.putString(SPrefCacheConstant.KEY_TOKEN, userData.token);
    SpUtil.putInt(SPrefCacheConstant.KEY_USER_ID, userData.id);
    SpUtil.putString(SPrefCacheConstant.KEY_USERNAME, userData.username);
    SpUtil.putString(SPrefCacheConstant.KEY_PASSWORD, password);
    listener.onSignInSuccess(loginResult);

    // set cache user
    // var resUser = _userService.getUserInfo(userData.userId);
    // resUser.then((res) async {
    //   SpUtil.putObject(SPrefCacheConstant.KEY_USER, res.data);
    // });
  }


}
