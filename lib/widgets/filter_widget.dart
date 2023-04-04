import 'package:e_com/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  int _selected = 0;

  final List<Map> _filters = [
    {
      'icon': Icons.home,
      'text': 'new arrivals',
    },
    {
      'icon': Icons.insights,
      'text': 'best sellers',
    },
    {
      'icon': Icons.person,
      'text': 'featured',
    },
    {
      'icon': Icons.category,
      'text': 'sale',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) => InkWell(
        onTap: () {
          setState(() {
            _selected = i;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            color: _selected == i ? kBackgroundColor : kGreyColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(
                _filters[i]['icon'],
                color: _selected == i ? Colors.white : Colors.black,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                _filters[i]['text'],
                style: TextStyle(
                  color: _selected == i ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      itemCount: _filters.length,
    );
  }
}
