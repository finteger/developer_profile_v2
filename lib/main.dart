import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      title: 'Developer Title',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          color: Colors.teal,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _launchURL(Uri url) async {
    //   if (await canLaunchUrl(url)) {
    await launchUrl(url);
    //  } else {
    //   throw 'Could not launch $url';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer Profile'),
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  margin: EdgeInsets.only(top: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(148),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 12,
                        spreadRadius: 60,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Transform.scale(
                    scale: 1.6,
                    child: CircleAvatar(
                      radius: 90,
                      backgroundImage: AssetImage('assets/images/rdp.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  iconSize: 60,
                  icon: Icon(Icons.email),
                  onPressed: () {
                    _launchURL(
                      Uri(scheme: 'mailto', path: 'example@example.com'),
                    );
                  },
                ),
                IconButton(
                  iconSize: 60,
                  icon: Icon(Icons.web),
                  onPressed: () {
                    _launchURL(
                      Uri.parse('https://linkedin.com/'),
                    );
                  },
                ),
                IconButton(
                  iconSize: 60,
                  icon: Icon(Icons.code),
                  onPressed: () {
                    _launchURL(
                      Uri.parse('https://GitHub.com/'),
                    );
                  },
                ),
                IconButton(
                  iconSize: 60,
                  icon: Icon(Icons.facebook_rounded),
                  onPressed: () {
                    _launchURL(
                      Uri.parse('https://facebook.com/'),
                    );
                  },
                ),
              ],
            ),
            Text(
              'Flutter developer with experience in building beautiful and performant mobile apps.',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
