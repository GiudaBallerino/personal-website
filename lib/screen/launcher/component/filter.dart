import 'package:flutter/material.dart';

import '../../../helper/data.dart';
class Filter extends StatefulWidget {
  const Filter({Key? key,required this.width, required this.height, required this.onSelected}) : super(key: key);

  final double width;
  final double height;
  final void Function(String) onSelected;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int? _value=0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 5,
          children: List<Widget>.generate(
            ImageCategory().list.length,
                (int index) {
              return ChoiceChip(
                label: Text('${ImageCategory().list[index]}'),
                selected: _value == index,
                onSelected: (bool selected) {
                  setState(() {
                    _value = selected ? index : null;
                    widget.onSelected(ImageCategory().list[index]);
                  });
                },
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
