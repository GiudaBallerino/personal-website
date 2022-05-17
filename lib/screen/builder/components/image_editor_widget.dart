import 'package:flutter/material.dart';
import 'package:personal_website/utils/constant.dart';

class ImageEditorWidget extends StatefulWidget {
  const ImageEditorWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.image})
      : super(key: key);

  final double width;
  final double height;
  final Image image;
  @override
  State<ImageEditorWidget> createState() => _ImageEditorWidgetState();
}

class _ImageEditorWidgetState extends State<ImageEditorWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: kAltBackgroundColor,
                  borderRadius: BorderRadius.circular(15)),
              child: widget.image,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 30),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('fit: '),
                      ),
                    ),
                    SizedBox(
                      width: widget.width * 0.8,
                      child: DropdownButtonFormField<BoxFit>(
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
                        value: widget.image.fit,
                        items: <BoxFit>[
                          BoxFit.cover,
                          BoxFit.fill,
                          BoxFit.fitHeight,
                          BoxFit.fitWidth,
                          BoxFit.contain,
                          BoxFit.scaleDown,
                          BoxFit.none
                        ].map<DropdownMenuItem<BoxFit>>(
                                (BoxFit value) {
                              return DropdownMenuItem<BoxFit>(
                                value: value,
                                child: SizedBox(
                                  width: widget.width * 0.6,
                                  child: Text(value.name),
                                ),
                              );
                            }).toList(),
                        onChanged: (BoxFit? fit) {
                          //widget.onChanged();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
