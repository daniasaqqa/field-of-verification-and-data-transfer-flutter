import 'package:ass_toww/main.dart';
import 'package:ass_toww/models/user.dart';
import 'package:ass_toww/secreens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'profile_client.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String mobile;
  String password;
  List<User> userData = MyApp.userList;
  GlobalKey<FormState> formKey = GlobalKey();

  saveForm(String mobile, String password) {
    final isValid = formKey.currentState.validate();

    if (!isValid) {
      print('Not Valid');
    }

    formKey.currentState.save();

    final data = userData.indexWhere(
        (element) => element.mobile == mobile && element.password == password);
    print('for Click');

    print(userData[0].accountName);
    print(userData[0].mobile);
    print(userData[0].password);
    print(data);
    print('-------------');
    // print(userData[data].password);

    if (data >= 0) {
      print('موجود');

      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ProfileClient(
          accountName: userData[data].accountName,
          country: userData[data].country,
          mobile: userData[data].mobile,
          companyName: userData[data].companyName,
        );
      }));
    } else {
      print('غير موجود');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Row(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    width: 100,
                    child: Image(
                      image: AssetImage(
                        'assets/images/img_one.png',
                      ),
                    )),
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 20, left: 70),
                  child: Text(
                    'Log in',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 70, left: 18),
                child: Text(
                  'Enter your data',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                )),
            Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                              validator: (value) {
                                if (value == null || value == "") {
                                  return 'required field';
                                }
                              },
                              onChanged: (newValue) {
                                mobile = newValue;
                              },
                              onSaved: (newValue) {
                                mobile = newValue;
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'Mobile',
                                fillColor: Colors.black12,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                              ))),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          obscureText: true,
                          onSaved: (newValue) {
                            setState(() {
                              password = newValue;
                            });
                          },
                          onChanged: (newValue) {
                            setState(() {
                              password = newValue;
                            }); //
                          },
                          validator: (String value) {
                            if (value == null || value == "") {
                              return 'required field';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            fillColor: Colors.black12,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        FlatButton(
                          child: Text('Forgot password?',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                  color: Colors.black54)),
                          onPressed: () {},
                        )
                      ]),
                      Container(
                        width: 300,
                        height: 70,
                        margin: EdgeInsets.only(top: 15, bottom: 6),
                        child: RaisedButton(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          color: Colors.black87,
                          splashColor: Colors.blueGrey[900],
                          textColor: Colors.white,
                          onPressed: () {
                            setState(() {});
                            // if (mobile != null || password != null)
                            saveForm(mobile, password);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have account?',
                              style: TextStyle(color: Colors.black54),
                            ),
                            FlatButton(
                              child: Text('Sign up',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 16,
                                  )),
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return SignUp();
                                }));
                              },
                            )
                          ]),
                    ],
                  ),
                )),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(top: 200),
              child: Image(image: AssetImage('assets/images/img_tow.png')),
            ),
          ]),
        ),
      ),
    );
  }
}
