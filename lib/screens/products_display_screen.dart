import 'package:e_com/utils/colors.dart';
import 'package:e_com/utils/data.dart';
import 'package:e_com/utils/utils.dart';
import 'package:e_com/widgets/custom_app_bar.dart';
import 'package:e_com/widgets/filter_widget.dart';
import 'package:e_com/widgets/product_widget.dart';
import 'package:e_com/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductsDisplayScreen extends StatelessWidget {
  const ProductsDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      backgroundColor: kBackgroundColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Container(
          child: Column(
            children: [
              const CustomAppBar(),
              const SizedBox(
                height: 15,
              ),
              const SearchBar(
                text: 'Search for products',
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 50,
                child: FilterWidget(),
              ),
              const SizedBox(
                height: 15,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.4,
                ),
                shrinkWrap: true,
                itemBuilder: (context, i) => ProductWidget(
                  product: products[i],
                ),
                itemCount: products.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
