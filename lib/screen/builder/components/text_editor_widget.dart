import 'package:flutter/material.dart';
import 'package:text_style_editor/text_style_editor.dart';

class TextEditorWidget extends StatefulWidget {
  TextEditorWidget(
      {Key? key, required this.width, required this.height, required this.text})
      : super(key: key);

  double width;
  double height;
  Text text;
  @override
  State<TextEditorWidget> createState() => _TextEditorWidgetState();
}

class _TextEditorWidgetState extends State<TextEditorWidget> {
  List<String> fonts = [
    'Billabong',
    'AlexBrush',
    'Allura',
    'Arizonia',
    'ChunkFive',
    'GrandHotel',
    'GreatVibes',
    'Lobster',
    'OpenSans',
    'OstrichSans',
    'Oswald',
    'Pacifico',
    'Quicksand',
    'Roboto',
    'SEASRN',
    'Windsong',
  ];
  List<Color> paletteColors = [
    Colors.black,
    Colors.white,
    Color(int.parse('0xffEA2027')),
    Color(int.parse('0xff006266')),
    Color(int.parse('0xff1B1464')),
    Color(int.parse('0xff5758BB')),
    Color(int.parse('0xff6F1E51')),
    Color(int.parse('0xffB53471')),
    Color(int.parse('0xffEE5A24')),
    Color(int.parse('0xff009432')),
    Color(int.parse('0xff0652DD')),
    Color(int.parse('0xff9980FA')),
    Color(int.parse('0xff833471')),
    Color(int.parse('0xff112CBC4')),
    Color(int.parse('0xffFDA7DF')),
    Color(int.parse('0xffED4C67')),
    Color(int.parse('0xffF79F1F')),
    Color(int.parse('0xffA3CB38')),
    Color(int.parse('0xff1289A7')),
    Color(int.parse('0xffD980FA'))
  ];
  late TextStyle textStyle;
  late TextAlign textAlign;

  @override
  void initState() {
    textStyle = widget.text.style!;
    textAlign = widget.text.textAlign!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.text.data!,
                style: textStyle,
                textAlign: textAlign,
                maxLines: 10,
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Container(
              height: 300,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: TextStyleEditor(
                  fonts: fonts,
                  paletteColors: paletteColors,
                  textStyle: textStyle,
                  textAlign: textAlign,
                  initialTool: EditorToolbarAction.fontFamilyTool,
                  onTextAlignEdited: (align) {
                    setState(() {
                      textAlign = align;
                    });
                  },
                  onTextStyleEdited: (style) {
                    setState(() {
                      textStyle = textStyle.merge(style);
                    });
                  },
                  onCpasLockTaggle: (caps) {
                    print(caps);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
