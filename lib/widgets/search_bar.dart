import 'package:e_com/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchBar extends StatelessWidget {
  final String text;
  const SearchBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: kGreyColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 17,
          ),
          Icon(
            Icons.search,
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
