import 'package:e_com/utils/colors.dart';
import 'package:e_com/utils/data.dart';
import 'package:e_com/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductWidget extends StatefulWidget {
  Product product;

  ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kGreyColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        widget.product.productImageUrl,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 3,
                  right: 5,
                  child: CircleAvatar(
                    backgroundColor: kBackgroundColor,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.product.isLiked = !widget.product.isLiked;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color:
                            widget.product.isLiked ? Colors.red : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.productName,
                  style: kNormalStyle.copyWith(
                    fontSize: 17,
                    color: kBackgroundColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      widget.product.currentPrice + '\$',
                      style: kNormalStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      widget.product.currentPrice + '\$',
                      style: kNormalStyle.copyWith(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.5),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
