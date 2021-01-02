import 'package:ass_toww/secreens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileClient extends StatelessWidget {
  final String accountName;
  final String country;
  final String mobile;
  final String companyName;
  List<String> imageData = [
    'assets/images/one.png',
    'assets/images/tow.png',
    'assets/images/three.png',
    'assets/images/four.png',
    'assets/images/five.png',
    'assets/images/ten.png',
    'assets/images/seven.png',
    'assets/images/eight.png',
    'assets/images/nine.png',
    'assets/images/ten.png',
    'assets/images/eleven.png',
    'assets/images/twelfth.png',
    'assets/images/thirteen.png',
  ];

  ProfileClient(
      {this.accountName, this.country, this.mobile, this.companyName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            width: double.maxFinite,
            child: Row(
              children: [
                Container(child: Text('STYLISH')),
                Container(
                  margin: EdgeInsets.only(left: 180.7),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )

          // IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {},
          // )
          ,
          backgroundColor: Colors.white,
        ),
        endDrawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/thirteen.png'),
                    radius: 40,
                  ),
                ),
                accountName: Text(accountName),
                accountEmail: Text('dania@gmail.com'),
              ),
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
              ),
              ListTile(
                title: Text('Search'),
                leading: Icon(Icons.search),
              ),
              ListTile(
                title: Text('Favourite'),
                leading: Icon(Icons.favorite),
              ),
              ListTile(
                title: Text('profile'),
                leading: Icon(Icons.account_circle),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
                title: Text('Logout'),
                leading: Icon(Icons.exit_to_app),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black87,
              ),
              title: Text('home', style: TextStyle(color: Colors.black87)),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
                title: Text(
                  'Search',
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.black54,
                ),
                title: Text(
                  'favorite',
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.black54,
                ),
                title: Text(
                  'profile',
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 18),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/welc_one.png'),
                      radius: 50,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        // padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '1,252',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'post',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 16),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text(
                                        '4m',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          'followers',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16),
                                        ))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          '256',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          'following',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16),
                                        ))
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: 220,
                              height: 40,
                              margin: EdgeInsets.only(top: 15, bottom: 6),
                              child: RaisedButton(
                                child: Text(
                                  'Edit profile',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                color: Colors.grey[200],
                                splashColor: Colors.blueGrey[900],
                                textColor: Colors.black38,
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 5, top: 15),
                  child: Text(accountName,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 5, top: 5),
                  child: Text(companyName,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 5, top: 5),
                  child: Text('Contact us:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 5, top: 5),
                  child: Text(mobile,
                      style: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 5, top: 5),
                  child: Text(country,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Row(
                  children: [
                    Container(
                      width: 112,
                      height: 40,
                      margin: EdgeInsets.only(top: 15, bottom: 6),
                      child: RaisedButton(
                        child: Text(
                          'Add product',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        color: Colors.grey[200],
                        splashColor: Colors.blueGrey[900],
                        textColor: Colors.black38,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                    ),
                    Container(
                      width: 112,
                      height: 40,
                      margin: EdgeInsets.only(top: 15, bottom: 6, left: 10),
                      child: RaisedButton(
                        child: Text(
                          'Share',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        color: Colors.grey[200],
                        splashColor: Colors.blueGrey[900],
                        textColor: Colors.black38,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                    ),
                    Container(
                      width: 112,
                      height: 40,
                      margin: EdgeInsets.only(top: 15, bottom: 6, left: 10),
                      child: RaisedButton(
                        child: Text(
                          'Contact us',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        color: Colors.grey[200],
                        splashColor: Colors.blueGrey[900],
                        textColor: Colors.black38,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: 1,
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.grey[300],
                ),
                Container(
                  height: 550,
                  width: double.infinity,
                  alignment: Alignment.bottomCenter,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 3,
                      childAspectRatio: 2 / 2,
                      mainAxisSpacing: 3,
                      crossAxisCount: 3,
                    ),
                    itemCount: imageData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Image(
                          image: AssetImage(this.imageData[index]),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
