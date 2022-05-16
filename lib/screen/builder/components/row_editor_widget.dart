import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class RowEditorWidget extends StatefulWidget {
  RowEditorWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.row,
    required this.onChanged,
  }) : super(key: key);

  final double width;
  final double height;
  Row row;
  final Function(Row) onChanged;

  @override
  State<RowEditorWidget> createState() => _RowEditorWidgetState();
}

class _RowEditorWidgetState extends State<RowEditorWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('crossAxisAlignment: '),
            ),
            SizedBox(
              width: widget.width * 0.6,
              child: DropdownButtonFormField<CrossAxisAlignment>(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 1.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                value: widget.row.crossAxisAlignment,
                items: <CrossAxisAlignment>[
                  CrossAxisAlignment.start,
                  CrossAxisAlignment.center,
                  CrossAxisAlignment.stretch,
                  CrossAxisAlignment.end,
                ].map<DropdownMenuItem<CrossAxisAlignment>>(
                    (CrossAxisAlignment value) {
                  return DropdownMenuItem<CrossAxisAlignment>(
                    value: value,
                    child: SizedBox(
                      width: widget.width * 0.4,
                      child: Text(value.name),
                    ),
                  );
                }).toList(),
                onChanged: (CrossAxisAlignment? crossAxisAlignment) {
                  widget.onChanged(
                    Row(
                      crossAxisAlignment: crossAxisAlignment!,
                      mainAxisAlignment: widget.row.mainAxisAlignment,
                      mainAxisSize: widget.row.mainAxisSize,
                      children: widget.row.children,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('mainAxisAlignment: '),
              ),
              SizedBox(
                width: widget.width,
                child: DropdownButtonFormField<MainAxisAlignment>(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: kPrimaryColor, width: 1.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: kPrimaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  value: widget.row.mainAxisAlignment,
                  items: <MainAxisAlignment>[
                    MainAxisAlignment.end,
                    MainAxisAlignment.center,
                    MainAxisAlignment.start,
                    MainAxisAlignment.spaceBetween,
                    MainAxisAlignment.spaceEvenly,
                    MainAxisAlignment.spaceAround,
                  ].map<DropdownMenuItem<MainAxisAlignment>>(
                      (MainAxisAlignment value) {
                    return DropdownMenuItem<MainAxisAlignment>(
                      value: value,
                      child: SizedBox(
                        width: widget.width * 0.8,
                        child: Text(value.name),
                      ),
                    );
                  }).toList(),
                  onChanged: (MainAxisAlignment? mainAxisAlignment) {
                    widget.onChanged(
                      Row(
                        crossAxisAlignment: widget.row.crossAxisAlignment,
                        mainAxisAlignment: mainAxisAlignment!,
                        mainAxisSize: widget.row.mainAxisSize,
                        children: widget.row.children,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('mainAxisSize: '),
            ),
            SizedBox(
              width: widget.width * 0.5,
              child: DropdownButtonFormField<MainAxisSize>(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 1.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                value: widget.row.mainAxisSize,
                items: <MainAxisSize>[
                  MainAxisSize.max,
                  MainAxisSize.min,
                ].map<DropdownMenuItem<MainAxisSize>>((MainAxisSize value) {
                  return DropdownMenuItem<MainAxisSize>(
                    value: value,
                    child: SizedBox(
                      width: widget.width * 0.3,
                      child: Text(value.name),
                    ),
                  );
                }).toList(),
                onChanged: (MainAxisSize? mainAxisSize) {
                  widget.onChanged(
                    Row(
                      crossAxisAlignment: widget.row.crossAxisAlignment,
                      mainAxisAlignment: widget.row.mainAxisAlignment,
                      mainAxisSize: mainAxisSize!,
                      children: widget.row.children,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
