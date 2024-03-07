import 'package:flutter/material.dart';

import '../Utils/AppColors.dart';
import '../Utils/AppFontStyles.dart';
import '../Utils/static_assets.dart';

class ListTileHead extends StatelessWidget {
  String title;
  String trailing;

  ListTileHead(this.title, this.trailing);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppFontStyles.cardListTitle,),
          Text(trailing,style: AppFontStyles.smallIndente,),
        ],
      ),
    );
  }
}
class FiveStarRow extends StatelessWidget {
  double iconSize;

  FiveStarRow(this.iconSize);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star_rounded, color: AppColors.primaryColor,size: iconSize,),
        Icon(Icons.star_rounded, color: AppColors.primaryColor,size: iconSize,),
        Icon(Icons.star_rounded, color: AppColors.primaryColor,size: iconSize,),
        Icon(Icons.star_rounded, color: AppColors.primaryColor,size: iconSize,),
        Icon(Icons.star_rounded, color: AppColors.primaryColor,size: iconSize,),
      ],
    );
  }
}
class StaticPopularPackageTile extends StatelessWidget {
  const StaticPopularPackageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10),
      child: Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 160,
                    width: 120,
                    decoration: BoxDecoration(

                        image: DecorationImage(
                          image: AssetImage(StaticAssets.testImage), // Replace 'background_image.png' with your image path
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Kuta Resort', style:AppFontStyles.smallcardListTitle,),
                        Text(
                          '\$750', style:TextStyle(color: AppColors.primaryColor, fontSize: 18, fontWeight: FontWeight.w300),),
                        Row(
                          children: [
                            FiveStarRow(12),
                            Text('5.0', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600, fontSize: 10),),
                          ],
                        ),
                        Text('A Resort is a Place', softWrap: true,)


                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

