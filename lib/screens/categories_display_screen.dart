import 'package:e_com/utils/data.dart';
import 'package:e_com/widgets/custom_app_bar.dart';
import 'package:e_com/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoriesDisplayScreen extends StatelessWidget {
  const CategoriesDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CustomAppBar(),
          const SizedBox(
            height: 15,
          ),
          const SearchBar(text: 'Search for categories'),
          const SizedBox(
            height: 15,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      categories[index].thumbnailImage),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    // BlendMode.darken,
                    BlendMode.saturation,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.8),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  categories[index].categoryName,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            itemCount: categories.length,
          ),
          const SizedBox(
            height: 75,
          ),
        ],
      ),
    );
  }
}
