import 'package:flutter/material.dart';
import 'package:matchconnect/customizations/app_style.dart';
import 'package:matchconnect/customizations/size_config.dart';

class MatchDetails extends StatefulWidget {
  const MatchDetails({super.key});

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  List<String> categories = <String>[
    'All',
    'Data',
    'Airtime',
    'Cable',
    'Electricity',
    // 'Result check',
    // 'Airtime to cash'
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: const Color(0xff000000),
        appBar: AppBar(
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 100, left: 24, right: 24),
            child: Stack(clipBehavior: Clip.none, children: [
              Positioned(
                top: sizeVertical * 23,
                child: const TabBar(
                    isScrollable: true,
                    indicatorColor: kWhite,
                    tabs: [
                      Tab(
                        child: Text('Matches'),
                      ),
                      Tab(child: Text('Standing')),
                      Tab(child: Text('Odds')),
                      Tab(child: Text('H2H')),
                      Tab(child: Text('Odds'))
                    ]),
              ),
            ]),
          ),
          iconTheme: const IconThemeData(color: kWhite),
          backgroundColor: const Color(0xff292929),
          // backgroundColor: Colors.transparent,

          actions: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  backgroundColor: const Color(0xffD9D9D9)),
              child: const Text(
                'Live',
                style: TextStyle(color: kBlack),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.more_horiz_rounded,
              color: kWhite,
            ),
            const SizedBox(
              width: 24,
            ),
          ],
        ),

        body: TabBarView(children: [
          ListView(
            children: [
              Stack(
                // clipBehavior: Clip.antiAlias,
                children: [
                  Positioned(
                    //  top: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(30),
                          bottomStart: Radius.circular(30),
                        ),
                        color: Color(0xff292929),
                      ),
                      width: double.infinity,
                      height: 120,
                    ),
                  ),
                  Positioned(
                    //top: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Color(0xff0058E6),
                          borderRadius: BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(10),
                              bottomStart: Radius.circular(10),
                              topEnd: Radius.circular(10),
                              topStart: Radius.circular(10)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Column(children: [
                            Text(
                              'Leaugue Name',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            'assets/images/download (8) (1).png'),
                                      ),
                                      Text(
                                        'chelsea',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '20:45',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      Text(
                                        '20:45',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            'assets/images/download (8) (1).png'),
                                      ),
                                      Text(
                                        'chelsea',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      )
                                    ],
                                  )
                                ]),
                          ]),
                        ),
                      ),
                    ),
                  ),
                  //TODO: starts here
                ],
              ),
              //TODO: starts here

              SizedBox(
                height: sizeVertical * 6,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text('Matches', style: TextStyle(color: kWhite)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                  color: Color(0xff292929),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
                  child: Row(
                    children: [
                      Text(
                        '20:00',
                        style: TextStyle(
                            fontSize: sizeHorizontal * 1.5, color: kWhite),
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
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                  color: Color(0xff292929),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
                  child: Row(
                    children: [
                      Text(
                        '20:00',
                        style: TextStyle(
                            fontSize: sizeHorizontal * 1.5, color: kWhite),
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
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                  color: Color(0xff292929),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
                  child: Row(
                    children: [
                      Text(
                        '20:00',
                        style: TextStyle(
                            fontSize: sizeHorizontal * 1.5, color: kWhite),
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
            ],
          ),
          ListView(
            children: [
              SizedBox(
                height: sizeVertical * 32,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      'Standings',
                      style: TextStyle(color: kWhite),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          'P     W     D     L     G     PTS',
                          style: TextStyle(color: kWhite),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sizeVertical * 1,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff292929))),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Image.asset('assets/images/download (5) (2).png'),
                    ),
                    SizedBox(
                      width: sizeHorizontal * 1,
                    ),
                    const Text(
                      'team name',
                      style: TextStyle(color: kWhite),
                    ),
                    const Spacer(),
                    const Row(
                      children: [
                        Text(
                          '23   23   34   35   56   22',
                          style: TextStyle(
                            color: kWhite,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff292929))),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Image.asset('assets/images/download (6) (1).png'),
                    ),
                    SizedBox(
                      width: sizeHorizontal * 1,
                    ),
                    const Text(
                      'team name',
                      style: TextStyle(color: kWhite),
                    ),
                    const Spacer(),
                    const Row(
                      children: [
                        Text(
                          '23   23   34   35   56   22',
                          style: TextStyle(
                            color: kWhite,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff292929))),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Image.asset('assets/images/download (8) (1).png'),
                    ),
                    SizedBox(
                      width: sizeHorizontal * 1,
                    ),
                    const Text(
                      'team name',
                      style: TextStyle(color: kWhite),
                    ),
                    const Spacer(),
                    const Row(
                      children: [
                        Text(
                          '23   23   34   35   56   22',
                          style: TextStyle(
                            color: kWhite,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff292929))),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Image.asset('assets/images/download (2) (1).png'),
                    ),
                    SizedBox(
                      width: sizeHorizontal * 1,
                    ),
                    const Text(
                      'team name',
                      style: TextStyle(color: kWhite),
                    ),
                    const Spacer(),
                    const Row(
                      children: [
                        Text(
                          '23   23   34   35   56   22',
                          style: TextStyle(
                            color: kWhite,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          ListView(
            children: const [],
          ),
          ListView(
            children: [
              Stack(
                // clipBehavior: Clip.antiAlias,
                children: [
                  Positioned(
                    //  top: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(30),
                          bottomStart: Radius.circular(30),
                        ),
                        color: Color(0xff292929),
                      ),
                      width: double.infinity,
                      height: 120,
                    ),
                  ),
                  Positioned(
                    //top: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Color(0xff0058E6),
                          borderRadius: BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(10),
                              bottomStart: Radius.circular(10),
                              topEnd: Radius.circular(10),
                              topStart: Radius.circular(10)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Column(children: [
                            Text(
                              'Leaugue Name',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            'assets/images/download (8) (1).png'),
                                      ),
                                      Text(
                                        'chelsea',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '20:45',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      Text(
                                        '20:45',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            'assets/images/download (8) (1).png'),
                                      ),
                                      Text(
                                        'chelsea',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      )
                                    ],
                                  )
                                ]),
                          ]),
                        ),
                      ),
                    ),
                  ),
                  //TODO: starts here
                ],
              ),
              //TODO: starts here

              SizedBox(
                height: sizeVertical * 6,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text('Summary', style: TextStyle(color: kWhite)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                  color: Color(0xff292929),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
                  child: Column(
                    children: [
                      const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Wins 5',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text('Draw 0',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text('Wins 0',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ]),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  width: (5 / (5 + 0 + 0) * 100),
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius:
                                          BorderRadius.circular(20))),
                              Expanded(
                                child: Container(
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                              Container(
                                  width: ((0 / (5 + 0 + 0)) * 100),
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(20))),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: sizeVertical * 3),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    color: Color(0xff292929),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
                    child: Column(
                      children: [
                        const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Wins 6',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text('Draw 1',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text('Wins 6',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ]),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    width: (7 / (7 + 1 + 4) * 100) *
                                        MediaQuery.of(context).size.width /
                                        100,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                Expanded(
                                  child: Container(
                                      // width: 1
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                                Container(
                                    width: ((1 / (7 + 1 + 1)) * 100) *
                                        MediaQuery.of(context).size.width /
                                        100,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: sizeVertical * 3),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    color: Color(0xff292929),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
                    child: Column(
                      children: [
                        const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Wins 2',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text('Draw 5',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text('Wins 4',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ]),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    width: (2 / (2 + 5 + 4) * 100) *
                                        MediaQuery.of(context).size.width /
                                        100,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                Expanded(
                                  child: Container(
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                                Container(
                                    width: ((4 / (2 + 5 + 4)) * 100) *
                                        MediaQuery.of(context).size.width /
                                        100,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //TODO: ENDS.....................
            ],
          ),
          ListView(
            children: const [],
          )
        ]),

        // body: ListView(
        //   children: [

        //     Stack(
        //       children: [
        //         Container(
        //           width: double.infinity,
        //           height: sizeVertical * 15,
        //           decoration: const BoxDecoration(
        //             borderRadius: BorderRadius.only(
        //                 bottomLeft: Radius.circular(50),
        //                 bottomRight: Radius.circular(50)),
        //             color: Color(0xff292929),
        //           ),
        //         ),
        //         Positioned(
        //           child: Container(
        //             width: sizeHorizontal * 40,
        //             height: sizeVertical * 30,
        //             decoration: const BoxDecoration(color: Color(0xff0058E6)),
        //           ),
        //         )
        //       ],
        //     ),
        //     // ListView.builder(
        //     //     physics: const BouncingScrollPhysics(),
        //     //     itemCount: categories.length,
        //     //     scrollDirection: Axis.horizontal,
        //     //     itemBuilder: (context, index) {
        //     //       return GestureDetector(
        //     //         child: Container(
        //     //           margin: EdgeInsets.only(
        //     //             left: current == 0 ? 12 : 15,
        //     //             // right: current == categories.length - 1 ? 15 : 1,
        //     //           ),
        //     //           padding: const EdgeInsets.symmetric(horizontal: 10),
        //     //           height: 36,
        //     //           decoration: BoxDecoration(
        //     //             borderRadius: BorderRadius.circular(8),
        //     //             color: current == index ? kBrown : kWhite,
        //     //             border: current == index
        //     //                 ? null
        //     //                 : Border.all(
        //     //                     color: kLightGrey,
        //     //                     width: 1,
        //     //                   ),
        //     //           ),
        //     //           child: Row(
        //     //             children: [
        //     //               Text(
        //     //                 categories[index],
        //     //                 style: TextStyle(
        //     //                   color: current == index ? kWhite : kDarkBrown,
        //     //                   fontSize: SizeConfig.blockSizeHorizontal! * 2,
        //     //                 ),
        //     //               )
        //     //             ],
        //     //           ),
        //     //         ),
        //     //       );
        //     //     }),

        //     const DefaultTabController(
        //       length: 5,
        //       initialIndex: 0,
        //       child: SizedBox(
        //         width: double.infinity,
        //         child:
        //             TabBar(isScrollable: true, indicatorColor: kWhite, tabs: []),
        //       ),
        //     ),
        //     Container(child: const TabBarView(children: []))
        //   ],
        // ),
      ),
    );
  }
}
