import 'package:ass_toww/main.dart';
import 'package:ass_toww/models/user.dart';
import 'package:ass_toww/secreens/login.dart';
import 'package:ass_toww/secreens/profile_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:string_validator/string_validator.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool istrue = false;
  int selectedRadio = 0;
  String dropdown = "Gender";
  String dropdown2 = "Country";
  String companyName;
  String accountName;
  String passwoed;
  String conPssword;
  String email;
  String mobile;
  String hintName = "Name";
  GlobalKey<FormState> formKey = GlobalKey();

  saveForm() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      MyApp.userList
          .add(User(companyName, accountName, mobile, dropdown2, passwoed));

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return Login();
        }),
      );
    }
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
    if (val == 1) {
      setState(() {
        hintName = 'Company Name';
      });
    } else {
      setState(() {
        hintName = 'Name';
      });
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
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Sign up',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Form(
            key: formKey,
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 20, left: 25),
                        child: Text(
                          'Enter your data',
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        )),
                    Container(
                        // margin: EdgeInsets.only(left: 12),
                        child: Row(
                      children: <Widget>[
                        Row(children: [
                          Radio(
                            value: 1,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                setSelectedRadio(value);
                              });
                            },
                          ),
                          const Text('Company'),
                        ]),
                        Row(children: [
                          Radio(
                            value: 2,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                setSelectedRadio(value);
                              });
                            },
                          ),
                          const Text('Name'),
                        ]),
                      ],
                    )),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                            onSaved: (newValue) {
                              this.companyName = newValue;
                            },
                            validator: (value) {
                              if (value == null || value == "") {
                                return 'required field';
                              }
                            },
                            decoration: InputDecoration(
                              labelText: hintName,
                              fillColor: Colors.black12,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                            ))),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20)),
                      child: DropdownButton<String>(
                        value: dropdown,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 42,
                        underline: SizedBox(),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdown = newValue;
                          });
                        },
                        items: <String>['Gender', 'Male', 'Female']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                            onSaved: (newValue) {
                              this.accountName = newValue;
                            },
                            validator: (value) {
                              if (value == null || value == "") {
                                return 'required field';
                              }
                            },
                            decoration: InputDecoration(
                              labelText: '@Account name',
                              fillColor: Colors.black12,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                            ))),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                            decoration: InputDecoration(
                          labelText: 'Instagram Account',
                          fillColor: Colors.black12,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                        ))),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                            onSaved: (newValue) {
                              this.mobile = newValue;
                            },
                            validator: (value) {
                              if (value == null || value == "") {
                                return 'required field';
                              }
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
                            onSaved: (newValue) {
                              this.email = newValue;
                            },
                            validator: (value) {
                              if (value == null || value == "") {
                                return 'required field';
                              } else if (!isEmail(value)) {
                                return 'wrong email syntax';
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              fillColor: Colors.black12,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                            ))),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20)),
                      child: DropdownButton<String>(
                        value: dropdown2,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 42,
                        underline: SizedBox(),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdown2 = newValue;
                          });
                        },
                        items: <String>[
                          'Country',
                          'Palestine',
                          'Canada',
                          'America',
                          'Egypt',
                          'Turkey',
                          'jorden',
                          'Qatar',
                          'Korea',
                          'China',
                          'Japan',
                          'India',
                          'Russa',
                          'British',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                            onSaved: (newValue) {
                              this.passwoed = newValue;
                            },
                            onChanged: (value) {
                              this.passwoed = value;
                            },
                            obscureText: true,
                            validator: (String value) {
                              if (value == null || value == "") {
                                return 'required field';
                              } else if (value.length < 6) {
                                return 'very week password';
                              }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              fillColor: Colors.black12,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                            ))),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                            onChanged: (value) {
                              this.conPssword = value;
                            },
                            onSaved: (newValue) {
                              this.conPssword = newValue;
                            },
                            // ignore: missing_return
                            validator: (value) {
                              if (value == null || value == "") {
                                return 'required field';
                              } else if (this.conPssword != this.passwoed) {
                                return 'password not matched';
                              }
                            },
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Confirmpassword',
                              fillColor: Colors.black12,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                            ))),
                    Container(
                      width: 300,
                      height: 70,
                      margin: EdgeInsets.only(top: 15, bottom: 6),
                      child: RaisedButton(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        color: Colors.black87,
                        splashColor: Colors.blueGrey[900],
                        textColor: Colors.white,
                        onPressed: () {
                          saveForm();
                          setState(() {});
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                  ],
                )),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Already have account?',
              style: TextStyle(color: Colors.black54),
            ),
            FlatButton(
              child: Text('Login',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  )),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              },
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            FlatButton(
              child: Text('Skip',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  )),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProfileClient(
                    accountName: "Home Furneture",
                    country: 'Chennai, India',
                    mobile: '+925 987 952 2365',
                    companyName: 'Home accessories, some information about us',
                  );
                }));
              },
            )
          ]),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(bottom: 0.0, right: 0.0),
            child: Image(image: AssetImage('assets/images/img_tow.png')),
          ),
        ]),
      )),
    );
  }
}
