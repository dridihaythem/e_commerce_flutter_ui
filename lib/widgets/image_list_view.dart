import 'dart:async';
import 'dart:math';

import 'package:e_com/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageListView extends StatefulWidget {
  final int startIndex;

  const ImageListView({super.key, required this.startIndex});

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.startIndex != 1) {
        _autoScroll();
      }
    });
  }

  void _autoScroll() {
    final currentPosition = _scrollController.offset;
    final endPosition = _scrollController.position.maxScrollExtent;

    _scrollController.animateTo(
      currentPosition == endPosition ? 0 : endPosition,
      duration: Duration(seconds: 10),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 50,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.60,
        height: MediaQuery.of(context).size.height * 0.60,
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  products[widget.startIndex + index].productImageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          itemCount: 5,
        ),
      ),
    );
  }
}
