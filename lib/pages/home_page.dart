import 'package:flutter/material.dart';
import 'package:myhost_app/pages/app_route.dart';
import 'package:myhost_app/pages/configs/app_setting.dart';
import 'package:myhost_app/pages/configs/network_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Index for tracking the selected tab
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/user.png'),
              ),
              accountName: Text('คุณครูพระจันทร์ ยิ้ม'),
              accountEmail: Text('myhostbkk@gmail.com'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'info');
              },
              leading: Icon(
                Icons.account_box,
                color: Colors.orange,
              ),
              title: Text('My Info'),
            ),
            Spacer(),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'login');
              },
              leading: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                left: 16.0,
                top: 60.0,
                child: Builder(
                  builder: (context) => IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 35.0,
                      color: Colors.orange,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              ),
              Positioned(
                right: 16.0,
                top: 60.0,
                child: IconButton(
                  icon: Icon(
                    Icons.notifications,
                    size: 35.0,
                    color: Colors.orange,
                  ),
                  onPressed: () {},
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Image.asset(
                    'assets/logoMyhost.png',
                    scale: 1.0,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.shade400, Colors.orange.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 200.0, // Adjust the height of the first card
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ภานุวัฒน์ จันทร์ทอง',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '923-4669-25-8',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                'ยอดคงเหลือ',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '   0 บาท',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 130.0, // Adjust the height of the second card
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            // Handle navigation or state changes based on index
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
