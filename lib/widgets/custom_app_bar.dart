import 'package:e_com/utils/colors.dart';
import 'package:e_com/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'AppName',
          style: kNormalStyle.copyWith(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        Stack(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: kGreyColor.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_none,
                size: 27,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: 12,
        ),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                'https://haythemdridi.com/profile.jpg',
              ),
            ),
          ),
        )
      ],
    );
  }
}
