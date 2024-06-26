import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/areas_table.dart';
import 'package:multi_split_view_demo/macros.dart';

class AreaSizePage extends DemoFluPage {
  MultiSplitViewController? _controller;

  MultiSplitViewController get controller {
    _controller ??= _buildController();
    return _controller!;
  }

  MultiSplitViewController? _maxMinController;

  MultiSplitViewController get maxMinController {
    _maxMinController ??= _buildMaxMinController();
    return _maxMinController!;
  }

  MultiSplitViewController _buildController() {
    //@demoflu_start:controller
    var controller = MultiSplitViewController(areas: [
      Area(size: 50, builder: (context, area) => Draft.blue(), data: 'blue'),
      Area(flex: 1, builder: (context, area) => Draft.yellow(), data: 'yellow'),
      Area(flex: 1, builder: (context, area) => Draft.green(), data: 'green')
    ]);
    //@demoflu_end:controller
    return controller;
  }

  MultiSplitViewController _buildMaxMinController() {
    //@demoflu_start:maxMinController
    var controller = MultiSplitViewController(areas: [
      Area(
          size: 50,
          max: 250,
          min: 20,
          builder: (context, area) => Draft.blue(),
          data: 'blue'),
      Area(flex: 1, builder: (context, area) => Draft.yellow(), data: 'yellow'),
      Area(flex: 1, builder: (context, area) => Draft.green(), data: 'green')
    ]);
    //@demoflu_end:maxMinController
    return controller;
  }

  MultiSplitView _buildView(MultiSplitViewController controller) {
    //@demoflu_start:view
    var view = MultiSplitView(controller: controller);
    //@demoflu_end:view
    return view;
  }

  void _resetController() {
    _controller!.areas = _buildController().areas;
  }

  void _resetMaxMinController() {
    _maxMinController!.areas = _buildMaxMinController().areas;
  }

  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();

    sections.heading('Area size');

    sections.text(text: 'Determines the fixed size in pixels.');

    sections.code('lib/area_size/area_size_page.dart',
        mark: 'controller', loadMode: LoadMode.readOnlyMarked);

    sections.code('lib/area_size/area_size_page.dart',
        mark: 'view', loadMode: LoadMode.readOnlyMarked);

    sections.tipBanner()
      ..add('Note that resizing area "blue" implies resizing all other')
      ..add(' flex areas as they fill the available space.');

    sections.group()
      ..runMacro(id: Macros.tryOut, context: context)
      ..widget((context) => ElevatedButton(
          onPressed: _resetController, child: const Text('Reset')))
      ..widget((context) => _buildView(controller))
          .runMacro(id: Macros.horizontalExample, context: context)
      ..widget((context) => AreasTable.fromController(controller));

    sections.heading('Max/min');

    sections.code('lib/area_size/area_size_page.dart',
        mark: 'maxMinController', loadMode: LoadMode.readOnlyMarked);

    sections.code('lib/area_size/area_size_page.dart',
        mark: 'view', loadMode: LoadMode.readOnlyMarked);

    sections.group()
      ..runMacro(id: Macros.tryOut, context: context)
      ..widget((context) => ElevatedButton(
          onPressed: _resetMaxMinController, child: const Text('Reset')))
      ..widget((context) => _buildView(maxMinController))
          .runMacro(id: Macros.horizontalExample, context: context)
      ..widget((context) => AreasTable.fromController(maxMinController));

    return sections;
  }
}
