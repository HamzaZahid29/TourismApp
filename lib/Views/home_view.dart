import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hamza/Utils/AppColors.dart';
import 'package:hamza/Utils/static_assets.dart';

import '../Utils/AppFontStyles.dart';
import '../Widgets/home_widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(StaticAssets.testImage),
            backgroundColor: Colors.red,
          ),
        ),
        title: Text(
          'Hey Prista',
          style: AppFontStyles.cardListTitle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SvgPicture.asset(
              StaticAssets.notificationIcon,
              width: 24,
              height: 24,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Where do you want to explore today?', style: AppFontStyles.appHeading,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 10),
                    child: Row(
                      children: [
                        Text('Search Destination', style: AppFontStyles.smallIndente,),
                      ],
                    ),
                  )),
            ),
            ListTileHead('Favourite Place', 'See All'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 270,
                child : ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal :10),
                       child : Container(
                          height: 250,
                          width: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('assets/icons/testimg.jpg'), // Replace 'background_image.png' with your image path
                              fit: BoxFit.cover, // Adjust the fit as needed
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: 260,
                                width: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent, // Top color (transparent)
                                      Colors.black.withOpacity(0.3), // Bottom color (black with opacity)
                                    ],
                                  ),
                                ),
                              ),
                              // White text
                              Positioned.fill(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(Icons.favorite, color: Colors.red,),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Kuta Beach' , style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
                                          Row(
                                            children: [
                                              Icon(Icons.location_on_outlined, color: Colors.white,),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                                child: Text('Bali , Indonasia' , style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300
                                                )),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              FiveStarRow(12),
                                              Text('5.0', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 10),)

                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                )
              ),
            ),
            ListTileHead('Popular Package', 'See All'),
            StaticPopularPackageTile(),
            StaticPopularPackageTile(),
            StaticPopularPackageTile(),

          ],
        ),
      ),
    );
  }
}
