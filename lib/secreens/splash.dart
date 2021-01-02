import 'package:ass_toww/secreens/login.dart';
import 'package:ass_toww/secreens/profile_client.dart';
import 'package:ass_toww/secreens/signup.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  CarouselSlider carouselSlider;
  int count = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final imgList = [
    'assets/images/welc_one.png',
    'assets/images/welc_tow.png',
    'assets/images/welc_three.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 0.0, left: 0.0),
            child: Image(image: AssetImage('assets/images/img_one.png')),
          ),
          Container(
            child: Text(
              'Buy your favourites',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 250,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30),
            child: Text(
              'personalization of your shopping brands',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                carouselSlider = CarouselSlider(
                  height: 350.0,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      count = index;
                    });
                  },
                  items: imgList.map((imgList) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              // color: Colors.green,
                              ),
                          child: Image(
                            image: AssetImage(imgList.toString()),
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(imgList, (index, url) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: count == index
                            ? Colors.black87
                            : Color.fromARGB(100, 49, 49, 49),
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            height: 70,
            margin: EdgeInsets.only(top: 15),
            child: RaisedButton(
              child: Text(
                'START SHOPPING',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              color: Colors.black87,
              splashColor: Colors.blueGrey[900],
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProfileClient(
                    accountName: "Home Furneture",
                    country: 'Chennai, India',
                    mobile: '+925 987 952 2365',
                    companyName: 'Home accessories, some information about us',
                  );

                  setState(() {});
                }));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              ),
              Text(
                'or',
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
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(bottom: 0.0, right: 0.0),
            child: Image(image: AssetImage('assets/images/img_tow.png')),
          ),
        ],
      ),
    ));
  }

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
