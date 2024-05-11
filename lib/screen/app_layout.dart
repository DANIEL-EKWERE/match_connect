import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:matchconnect/customizations/app_style.dart';
// import 'package:matchconnect/customizations/size_config.dart';
import 'package:matchconnect/screen/favourite_screen.dart';
import 'package:matchconnect/screen/home_screen.dart';
import 'package:matchconnect/screen/more_screen.dart';
import 'package:matchconnect/screen/watch_screen.dart';
//import 'package:url_launcher/url_launcher.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // initBannerAds();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    //  bannerAd!.dispose();
    super.dispose();
  }

  int selectedIndex = 0;
  bool isChecked = false;
  int currentIndex = 1;
// late VoidCallback openDrawer;
  // var adUnit = 'ca-app-pub-8689659519341801/7129774650';
  // BannerAd? bannerAd;
  // bool isLoaded = false;
  // initBannerAds() {
  //   bannerAd = BannerAd(
  //       size: AdSize.largeBanner,
  //       adUnitId: adUnit,
  //       listener: BannerAdListener(
  //         onAdLoaded: (ad) {
  //           setState(() {
  //             isLoaded = true;
  //           });
  //           print('loading.......');
  //         },
  //         onAdFailedToLoad: (ad, error) {
  //           ad.dispose();
  //           print(error);
  //         },
  //       ),
  //       request: const AdRequest());

  //   bannerAd!.load();
  // }

  // void launchEamil(BuildContext context) async {
  //   // if (url != null) {
  //   Uri email = Uri.parse(
  //       'mailto:audreyart062@gmail.com?subject=Art Vista&body=hello there Art Vista.....');
  //   if (await canLaunchUrl(email)) {
  //     await launchUrl(email);
  //   } else {
  //     throw 'could not launch $email';
  //   }
  //   // } else {
  //   //   showMessage(context: context, message: 'something went wrong');
  //   // }
  // }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const FavouriteScreen(),
    const WatchScreen(),
    const MoreScreen(),
  ];
  onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
//double sizeVertical = SizeConfig.blockSizeHorizontal!;
    return Scaffold(
      // bottomNavigationBar: isLoaded
      //     ? SizedBox(
      //         height: bannerAd!.size.height.toDouble(),
      //         width: bannerAd!.size.width.toDouble(),
      //         child: AdWidget(ad: bannerAd!),
      //       )
      //     : const SizedBox(),

      bottomNavigationBar: BottomNavigationBar(
          backgroundColor:const Color(0xff000000),
          selectedItemColor: kBlue,
          unselectedItemColor: kDarkGrey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          enableFeedback: true,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: onTap,
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.football), label: 'Home'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.star), label: 'Favourite'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.newspaper), label: 'For You'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.commentDots), label: 'more'),
          ]),

      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
    );
  }
}
