import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

class ColorExample extends StatelessWidget {
  const ColorExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //@demoflu_start:show
    MultiSplitView multiSplitView = MultiSplitView(initialAreas: [
      Area(builder: (context, area) => Draft.blue()),
      Area(builder: (context, area) => Draft.yellow()),
      Area(builder: (context, area) => Draft.green())
    ]);

    MultiSplitViewTheme theme = MultiSplitViewTheme(
        data: MultiSplitViewThemeData(
            dividerPainter: DividerPainters.background(color: Colors.black)),
        child: multiSplitView);
    //@demoflu_end:show

    return theme;
  }
}
