import 'dart:async';

import 'package:flutter/material.dart';

enum AuthMode { Login, Register }

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _authMode = AuthMode.Login;

  void _toggleAuthMode() {
    setState(() {
      _authMode =
          _authMode == AuthMode.Login ? AuthMode.Register : AuthMode.Login;
    });
  }

  @override
  Widget build(BuildContext context) {
    String _btnText = _authMode == AuthMode.Login ? "Login" : "Register";
    String _titleText =
        _authMode == AuthMode.Login ? "Welcome," : "Create Account,";
    String _subtitleText = _authMode == AuthMode.Login
        ? "Sign in to continue!,"
        : "Sign up to get started!";

    String _btmBtnText = _authMode == AuthMode.Login
        ? "Don't have an account? sign up"
        : "Already have an account? Sign in";

    String _appBarText = _authMode == AuthMode.Login ? "Sign in" : "Sign Up";
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarText),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(
                "$_titleText",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text("$_subtitleText"),
              const SizedBox(height: 20),
              if (_authMode == AuthMode.Register) ...[
                TextField(
                  decoration: InputDecoration(
                    hintText: "Full name",
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
              TextField(
                decoration: InputDecoration(
                  hintText: "Email address",
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {
                    KLoader.showLoader(context);
                    Timer(Duration(seconds: 4), () {
                      KLoader.hideLoader(context);
                    });
                  },
                  child: Text(_btnText),
                ),
              ),
              TextButton(
                onPressed: _toggleAuthMode,
                child: Text(_btmBtnText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KLoader {
  static showLoader(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Text('Loading...'),
            ],
          ),
        );
      },
    );
  }

  static hideLoader(BuildContext context) {
    Navigator.pop(context);
  }

  static confirm({
    @required BuildContext context,
    @required String title,
    @required String content,
    String posText = 'Yes',
    String negText = 'No',
  }) async {
    return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(negText),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(posText),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
