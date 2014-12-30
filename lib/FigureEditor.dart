library FigureEditor;

import "dart:html";

import "package:FrameUI/init.dart" as FrameUI;

part 'src/Workspace.dart';
part 'src/Model.dart';

class FigureEditor {

  CanvasRenderingContext2D context;
  FrameUI.Frame frame;
  FrameUI.TopPanel controlbar;
  FrameUI.LeftPanel toolbar;
  FrameUI.RightPanel extrabar;
  FrameUI.CenterPanel viewbar;
  FrameUI.Scroll modelList;
  Workspace workspace;
  int modelsId = 1;
  Map<String, FrameUI.IconButton> buttons = new Map<String, FrameUI.IconButton>();

  List<Model> models = new List<Model>();

  Rectangle area = new Rectangle(0, 0, 0, 0);

  int maxModels = 22;

  FigureEditor(int width, int height) {
    _initContext(new CanvasElement(width: width, height: height));
  }

  FigureEditor.fromCanvas(CanvasElement canvas) {
     _initContext(canvas);
  }

  _initContext(CanvasElement canvas) {
    context = canvas.getContext("2d");
    _initFrame();
  }

  _initFrame() {

    FrameUI.start();

    frame = new FrameUI.Frame.fromContext(context);
//    frame.frequency = new Duration(milliseconds: 50);
    frame.onBeforeRender.listen(_update);

    // init control bar
    controlbar = new FrameUI.TopPanel();
    frame.elements.add(controlbar);

    // buttons on control bar
    buttons["add"] = new FrameUI.IconButton(
        name: "Doc-Add",
        action: _createNewModel);
    controlbar.elements.add(buttons["add"]);

    buttons["del"] = new FrameUI.IconButton(
        name: "Doc-Del",
        action: _removeCurrentModel);
    controlbar.elements.add(buttons["del"]);

    buttons["clear"] = new FrameUI.IconButton(
        name: "Trash",
        action: _clearCurrentModel);
    controlbar.elements.add(buttons["clear"]);

    toolbar = new FrameUI.LeftPanel();
    frame.elements.add(toolbar);

    buttons["tool-create"] = new FrameUI.IconButton(
        name: "Overlay-edit",
        action: _createMode);
    toolbar.elements.add(buttons["tool-create"]);

    buttons["tool-move"] = new FrameUI.IconButton(
        name: "Trend Up",
        action: _moveMode);
    toolbar.elements.add(buttons["tool-move"]);


    // init models
    extrabar = new FrameUI.RightPanel();
    frame.elements.add(extrabar);

    // list of models
    modelList = new FrameUI.Scroll();
    modelList.area = new Rectangle(0, 0, 250, 400);
    extrabar.elements.add(modelList);
    modelList.onChange.listen(_onModelChange);

    // worksapce panel
    viewbar = new FrameUI.CenterPanel();
    viewbar.style.backgroundColor = [255, 255, 255];
    frame.elements.add(viewbar);

    workspace = new Workspace();
    viewbar.elements.add(workspace);

  }

  _createNewModel() {
    Model model = new Model(modelsId++);
    models.add(model);

    modelList.elements.add(
        new FrameUI.ScrollItem(model.id, "Model #${model.id}"));
  }

  _clearCurrentModel() {
    Model model = _getCurrentModel();

    if (model is Model) {
      model.points.clear();
      _createMode();
    }
  }

  _removeCurrentModel() {
    Model model = _getCurrentModel();

    if (model is Model) {
      models.remove(model);
      modelList.elements.remove(modelList.selected);
      modelList.selected = null;
    }
  }

  _createMode() {
    workspace.createMode();
  }

  _moveMode() {
    workspace.moveMode();
  }

  _getCurrentModel() {
    if (modelList is FrameUI.Scroll && modelList.selected is FrameUI.ScrollItem) {
        return models.singleWhere((model){
          return model.id == modelList.selected.id;
        });
    }

    return null;
  }

  _onModelChange(FrameUI.ScrollItem item) {
    workspace.model = _getCurrentModel();
  }

  _update(FrameUI.FrameEvent event) {
    Model current = _getCurrentModel();
    bool hasCurrent = current is Model;
    bool hasCurrentPoints = hasCurrent && current.points.length > 0;

    if (toolbar is FrameUI.LeftPanel) {
      toolbar.style.visible = hasCurrent;
    }

    buttons["add"].style.visible = maxModels > models.length;
    buttons["tool-create"].style.visible = hasCurrent;
    buttons["tool-move"].style.visible = hasCurrent && hasCurrentPoints;
    buttons["del"].style.visible = hasCurrent;
    buttons["clear"].style.visible = hasCurrentPoints;
  }

}




