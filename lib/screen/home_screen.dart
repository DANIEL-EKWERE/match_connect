import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:matchconnect/customizations/app_style.dart';
import 'package:matchconnect/customizations/size_config.dart';
import 'package:matchconnect/screen/match_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectSport;
  double width = 0.0;
  double height = 0.0;
  int selectedDate = 0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return DefaultTabController(
        length: 7,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: const Color(0xff000000),
          appBar: AppBar(
            backgroundColor: const Color(0xff292929),
            title: const Text(
              'Teams',
              style: TextStyle(fontWeight: FontWeight.bold, color: kWhite),
            ),
            actions: const [
              Icon(Icons.more_horiz_rounded),
              SizedBox(
                width: 24,
              )
            ],
            bottom:
                const TabBar(isScrollable: true, indicatorColor: kWhite, tabs: [
              Tab(
                icon: Icon(
                  Icons.search,
                  color: kWhite,
                  size: 30,
                ),
              ),
              Tab(
                child: Image(
                  image: AssetImage('assets/images/download (2) (1).png'),
                  width: 40,
                  height: 40,
                ),
              ),
              Tab(
                child: Image(
                  image: AssetImage('assets/images/download (3) (1).png'),
                  width: 40,
                  height: 40,
                ),
              ),
              Tab(
                child: Image(
                  image: AssetImage('assets/images/download (5) (1).png'),
                  width: 40,
                  height: 40,
                ),
              ),
              Tab(
                child: Image(
                  image: AssetImage('assets/images/download (5) (2).png'),
                  width: 40,
                  height: 40,
                ),
              ),
              Tab(
                child: Image(
                  image: AssetImage('assets/images/download (6) (1).png'),
                  width: 40,
                  height: 40,
                ),
              ),
              Tab(
                child: Image(
                  image: AssetImage('assets/images/download (8) (1).png'),
                  width: 40,
                  height: 40,
                ),
              ),
              Tab(
                child: Image(
                  image: AssetImage('assets/images/images (3).png'),
                  width: 40,
                  height: 40,
                ),
              ),
              Tab(
                child: Image(
                  image: AssetImage('assets/images/images (3).png'),
                  width: 40,
                  height: 40,
                ),
              ),
            ]),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ListView(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: sizeVertical * 10,
                      ),
                      SizedBox(
                        height: sizeVertical * 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: sizeHorizontal * 14,
                            child: DropdownButtonFormField<String>(
                              value: selectSport,
                              hint: const Text('FootBall'),
                              items: const [
                                DropdownMenuItem<String>(
                                  value: 'FootBall',
                                  child: Text('FootBall'),
                                ),
                              ],
                              onChanged: (category) {
                                setState(() {
                                  // selectedDate = category!;

                                  // fetchTransactions(selectedDate!);
                                });
                              },
                              decoration: InputDecoration(
                                focusedBorder: kInputBorder,
                                fillColor: kWhite,
                                filled: true,
                                hintText: 'FootBall',
                                labelText: '',
                                labelStyle: TextStyle(
                                    color: kDarkGrey,
                                    fontSize: sizeVertical * 2.0),
                                // hintStyle: kEncodeSansSemiBold.copyWith(
                                //     color: kLightGrey,
                                //     fontSize: SizeConfig.blockSizeHorizontal! * 2.0),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: kBrown,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon:
                                const Icon(Icons.sports_soccer, color: kWhite),
                            label: const Text('Game Prediction',
                                style: TextStyle(color: kWhite)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0058E6),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 70, right: 10),
                            height: sizeHorizontal * 5,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 8,
                                itemBuilder: (context, index) {
                                  final day = DateFormat("dd MMM").format(
                                      DateTime.now()
                                          .add(Duration(days: index)));
                                  final dayName = DateFormat("EEE").format(
                                      DateTime.now()
                                          .add(Duration(days: index)));
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedDate = index;
                                        });
                                      },
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              dayName,
                                              style: TextStyle(
                                                  color: selectedDate == index
                                                      ? kWhite
                                                      : kDarkGrey),
                                            ),
                                            Text(
                                              day,
                                              style: TextStyle(
                                                  color: selectedDate == index
                                                      ? kWhite
                                                      : kDarkGrey),
                                            ),
                                          ]),
                                    ),
                                  );
                                }),
                          ),
                          Positioned(
                            top: 10,
                            left: 0,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  backgroundColor: const Color(0xffD9D9D9)),
                              child: const Text(
                                'Live',
                                style: TextStyle(color: kBlack),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 12,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 5, top: 5, bottom: 5),
                              decoration:
                                  const BoxDecoration(color: Color(0xff000000)),
                              child: const Icon(
                                Icons.calendar_month,
                                color: kWhite,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Color(0xff0058E6),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            child: const Text(
                              'FIXTURES',
                              style: TextStyle(color: kWhite),
                            ),
                          ),
                          SizedBox(
                            width: sizeVertical * 2,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff0058E6)),
                              child: const Text(
                                'RESULTS',
                                style: TextStyle(color: kWhite),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: sizeVertical * 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => const MatchDetails(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff292929),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 24),
                            child: Row(
                              children: [
                                Text(
                                  '20:00',
                                  style: TextStyle(
                                      fontSize: sizeHorizontal * 1.5,
                                      color: kWhite),
                                ),
                                SizedBox(
                                  width: sizeHorizontal * 1,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 15,
                                          backgroundColor: kGrey,
                                          backgroundImage: AssetImage(
                                              'assets/images/download (8) (1).png'),
                                        ),
                                        SizedBox(
                                          width: sizeHorizontal * 1.5,
                                        ),
                                        Text('team name',
                                            style: TextStyle(
                                                fontSize: sizeHorizontal * 1.5,
                                                color: kWhite)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: sizeVertical * 1.5,
                                    ),
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 15,
                                          backgroundColor: kGrey,
                                          backgroundImage: AssetImage(
                                              'assets/images/download (5) (1).png'),
                                        ),
                                        SizedBox(
                                          width: sizeHorizontal * 1.5,
                                        ),
                                        Text('team name',
                                            style: TextStyle(
                                                fontSize: sizeHorizontal * 1.5,
                                                color: kWhite)),
                                      ],
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text('Leaugue Name',
                                        style: TextStyle(
                                          color: kWhite,
                                          fontSize: sizeHorizontal * 1.5,
                                        )),
                                    SizedBox(width: sizeHorizontal * 1),
                                    const CircleAvatar(
                                      radius: 15,
                                      backgroundColor: kGrey,
                                      backgroundImage: AssetImage(
                                          'assets/images/download (5) (2).png'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: sizeVertical * 2,
                      ),
                      // TODO: starts here ...........................
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff292929),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 24),
                          child: Row(
                            children: [
                              Text(
                                '20:00',
                                style: TextStyle(
                                    fontSize: sizeHorizontal * 1.5,
                                    color: kWhite),
                              ),
                              SizedBox(
                                width: sizeHorizontal * 1,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 15,
                                        backgroundColor: kGrey,
                                        backgroundImage: AssetImage(
                                            'assets/images/download (8) (1).png'),
                                      ),
                                      SizedBox(
                                        width: sizeHorizontal * 1.5,
                                      ),
                                      Text('team name',
                                          style: TextStyle(
                                              fontSize: sizeHorizontal * 1.5,
                                              color: kWhite)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizeVertical * 1.5,
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 15,
                                        backgroundColor: kGrey,
                                        backgroundImage: AssetImage(
                                            'assets/images/download (5) (1).png'),
                                      ),
                                      SizedBox(
                                        width: sizeHorizontal * 1.5,
                                      ),
                                      Text('team name',
                                          style: TextStyle(
                                              fontSize: sizeHorizontal * 1.5,
                                              color: kWhite)),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text('Leaugue Name',
                                      style: TextStyle(
                                        color: kWhite,
                                        fontSize: sizeHorizontal * 1.5,
                                      )),
                                  SizedBox(width: sizeHorizontal * 1),
                                  const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: kGrey,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (5) (2).png'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: sizeVertical * 3),

                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff292929),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 24),
                          child: Row(
                            children: [
                              Text(
                                '20:00',
                                style: TextStyle(
                                    fontSize: sizeHorizontal * 1.5,
                                    color: kWhite),
                              ),
                              SizedBox(
                                width: sizeHorizontal * 1,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 15,
                                        backgroundColor: kGrey,
                                        backgroundImage: AssetImage(
                                            'assets/images/download (8) (1).png'),
                                      ),
                                      SizedBox(
                                        width: sizeHorizontal * 1.5,
                                      ),
                                      Text('team name',
                                          style: TextStyle(
                                              fontSize: sizeHorizontal * 1.5,
                                              color: kWhite)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizeVertical * 1.5,
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 15,
                                        backgroundColor: kGrey,
                                        backgroundImage: AssetImage(
                                            'assets/images/download (5) (1).png'),
                                      ),
                                      SizedBox(
                                        width: sizeHorizontal * 1.5,
                                      ),
                                      Text('team name',
                                          style: TextStyle(
                                              fontSize: sizeHorizontal * 1.5,
                                              color: kWhite)),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text('Leaugue Name',
                                      style: TextStyle(
                                        color: kWhite,
                                        fontSize: sizeHorizontal * 1.5,
                                      )),
                                  SizedBox(width: sizeHorizontal * 1),
                                  const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: kGrey,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (5) (2).png'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: sizeVertical * 3),

                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff292929),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 24),
                          child: Row(
                            children: [
                              Text(
                                '20:00',
                                style: TextStyle(
                                    fontSize: sizeHorizontal * 1.5,
                                    color: kWhite),
                              ),
                              SizedBox(
                                width: sizeHorizontal * 1,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 15,
                                        backgroundColor: kGrey,
                                        backgroundImage: AssetImage(
                                            'assets/images/download (8) (1).png'),
                                      ),
                                      SizedBox(
                                        width: sizeHorizontal * 1.5,
                                      ),
                                      Text('team name',
                                          style: TextStyle(
                                              fontSize: sizeHorizontal * 1.5,
                                              color: kWhite)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizeVertical * 1.5,
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 15,
                                        backgroundColor: kGrey,
                                        backgroundImage: AssetImage(
                                            'assets/images/download (5) (1).png'),
                                      ),
                                      SizedBox(
                                        width: sizeHorizontal * 1.5,
                                      ),
                                      Text('team name',
                                          style: TextStyle(
                                              fontSize: sizeHorizontal * 1.5,
                                              color: kWhite)),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text('Leaugue Name',
                                      style: TextStyle(
                                        color: kWhite,
                                        fontSize: sizeHorizontal * 1.5,
                                      )),
                                  SizedBox(width: sizeHorizontal * 1),
                                  const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: kGrey,
                                    backgroundImage: AssetImage(
                                        'assets/images/download (5) (2).png'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      //TODO: ENDS.....................

                      SizedBox(height: sizeVertical * 10),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: sizeVertical * 20,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: sizeVertical * 20,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: sizeVertical * 20,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: sizeVertical * 20,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: sizeVertical * 20,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: sizeVertical * 20,
                      ),
                    ],
                  ),
                ]),
          ),
        ));
  }
}
