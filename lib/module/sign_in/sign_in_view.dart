import 'package:fb_clone_ctg/base/base_widget.dart';
import 'package:fb_clone_ctg/constant/route_constant.dart';
import 'package:fb_clone_ctg/constant/spref_constant.dart';
import 'package:fb_clone_ctg/module/sign_in/sign_in_bloc.dart';
import 'package:fb_clone_ctg/module/sign_in/sign_in_event.dart';
import 'package:fb_clone_ctg/shared/entities/login_result.dart';
import 'package:fb_clone_ctg/untils/spref_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  bool obscure = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!SpUtil.getString(SPrefCacheConstant.KEY_TOKEN).isEmpty) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteConstant.HOME, (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SignInBloc signInBloc = SignInBloc();
    signInBloc.setContext(context);

    return PageContainer(
      bloc: [Provider.value(value: SignInBloc())],
      hasTopNavBar: false,
      canSearch: false,
      child: MultiProvider(
        providers: [Provider.value(value: SignInBloc())],
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/icons/facebook.png",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: TextFormField(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        keyboardType: TextInputType.number,
                        controller: _userController,
                        validator: (String validate) {
                          if (validate.isEmpty) {
                            return "Must input";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "USESERNAME",

                            // snapshot.hasError ? snapshot.error : null,
                            labelStyle:
                                TextStyle(color: Colors.black54, fontSize: 15)),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          controller: _passController,
                          obscureText: obscure,
                          validator: (String validate) {
                            if (validate.isEmpty) {
                              return "Must input";
                            }
                            if (validate.length < 6) {
                              return "Password must have > 6 charactors";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "PASSWORD",

                              // snapshot.hasError ? snapshot.error : null,
                              labelStyle: TextStyle(
                                  color: Colors.black54, fontSize: 15)),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          child: Text("SHOW",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: RaisedButton(
                          onPressed: () => onSignInClick(signInBloc),
                          child: Text("Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(RouteConstant.SIGN_UP),
                          child: Text(
                            "NEW USER? SIGN UP",
                            style:
                                TextStyle(fontSize: 10, color: Colors.black54),
                          ),
                        ),
                        Text(
                          "FORGOT PASSWORD?",
                          style: TextStyle(fontSize: 10, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSignInClick(SignInBloc bloc) {
    // if (bloc.isValidInfo(_userController.text, _passController.text)) {
    //   print("dang nhap dung");
    //   //chuyen huong
    // }
    if (_form.currentState.validate()) {
      bloc.eventController.sink.add(SignInEvent(
          phoneNumber: _userController.text, password: _passController.text));
    }
    // Navigator.pushReplacementNamed(context, RouteConstant.HOME);
  }
}
