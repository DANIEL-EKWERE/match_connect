import 'package:flutter/material.dart';
import 'package:matchconnect/customizations/app_style.dart';
import 'package:matchconnect/customizations/size_config.dart';
import 'package:share_plus/share_plus.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      appBar: AppBar(
        backgroundColor: const Color(0xff292929),
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello!',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'Welcome to MatchConnect',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            SizedBox(
              height: sizeVertical * 5,
            ),
            GestureDetector(
              onTap: () {
                showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          backgroundColor: const Color(0xff292929),
                          title: const Text('About Us',
                              style: TextStyle(color: Colors.white)),
                          content: const Text(
                            'MatchConnect app is an app that\nprovides you Live Score,Streaming, Schedule and leaugues.!!!',
                            style: TextStyle(color: Colors.white),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              child: const Text('ok',
                                  style: TextStyle(color: Colors.white)),
                            )
                          ]);
                    });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: sizeHorizontal * 2,
                    vertical: sizeVertical * 2.5),
                width: double.infinity,
                height: sizeVertical * 8,
                decoration: const BoxDecoration(
                  color: Color(0xff292929),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Text(
                  'About Us',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: sizeVertical * 2,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: sizeHorizontal * 2, vertical: sizeVertical * 2.5),
              width: double.infinity,
              height: sizeVertical * 8,
              decoration: const BoxDecoration(
                color: Color(0xff292929),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Text(
                'Help',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: sizeVertical * 2,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: sizeHorizontal * 2, vertical: sizeVertical * 2.5),
              width: double.infinity,
              height: sizeVertical * 8,
              decoration: const BoxDecoration(
                color: Color(0xff292929),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Text(
                'Contact Us',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: sizeVertical * 2,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: sizeHorizontal * 2, vertical: sizeVertical * 2.5),
              width: double.infinity,
              height: sizeVertical * 8,
              decoration: const BoxDecoration(
                color: Color(0xff292929),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Text(
                'Privacy Policy',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: sizeVertical * 2,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: sizeHorizontal * 2, vertical: sizeVertical * 2.5),
              width: double.infinity,
              height: sizeVertical * 8,
              decoration: const BoxDecoration(
                color: Color(0xff292929),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Text(
                'Settings',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: sizeVertical * 2,
            ),
            Row(
              children: [
                const Text(
                  'Follow Us',
                  style: TextStyle(
                      color: kDarkGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: sizeHorizontal * 2,
                ),
                const Expanded(
                  child: Divider(
                    height: 10,
                    color: kDarkGrey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: sizeVertical * 2,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff292929),
                  radius: 25,
                ),
                CircleAvatar(
                  backgroundColor: Color(0xff292929),
                  radius: 25,
                ),
                CircleAvatar(
                  backgroundColor: Color(0xff292929),
                  radius: 25,
                ),
                CircleAvatar(
                  backgroundColor: Color(0xff292929),
                  radius: 25,
                ),
              ],
            ),
            SizedBox(
              height: sizeVertical * 5,
            ),
            GestureDetector(
              onTap: () {
                String shareLink =
                    "Hey! use this app for your match update and livescores  Link:(https://data-bank.com.ng)";

                Share.share(shareLink);
              },
              child: Container(
                width: double.infinity,
                height: sizeVertical * 5,
                decoration: const BoxDecoration(
                  color: Color(0xff292929),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Tell A Friend',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'MatchConnect an app registerd under the trademark ©, known for it trademark under the sport section',
                  style: TextStyle(
                    color: kLightGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
