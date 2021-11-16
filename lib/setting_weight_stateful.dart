import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/example_widget.dart';

class SettingWeightStatefulExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SettingWeightStatefulExample> with ContentBuilder {
  MultiSplitViewController _controller =
      MultiSplitViewController(weights: [0.1]);

  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);
    Widget child3 = buildContent(3);

    // setting 10% of weight for the first child
    MultiSplitView multiSplitView = MultiSplitView(
        children: [child1, child2, child3], controller: _controller);

    return multiSplitView;
  }
}
