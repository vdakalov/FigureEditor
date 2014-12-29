library ModelEditor;

import "dart:html";

import "package:FrameUI/FrameUI/FrameUI.dart" as WM;

part "Workspace.dart";
part "Model.dart";

class ModelEditor {

  CanvasRenderingContext2D context;
  WM.FrameUI frame;
  WM.PanelStructureElement frame_controlbar;
  WM.PanelStructureElement frame_toolbar;
  WM.PanelStructureElement frame_workspace;
  WM.ListItems frame_list;
  Workspace workspace;
  int modelsId = 1;
  Map<String, WM.IconButton> buttons = new Map<String, WM.IconButton>();

  List<Model> models = new List<Model>();

  Rectangle area = new Rectangle(0, 0, 0, 0);

  ModelEditor(int width, int height) {
    _initContext(new CanvasElement(width: width, height: height));
  }

  ModelEditor.fromCanvas(CanvasElement canvas) {
     _initContext(canvas);
  }

  _initContext(CanvasElement canvas) {
    context = canvas.getContext("2d");
    _initFrame();
  }

  _initFrame() {

    frame = new WM.FrameUI(context);
    frame.beforeRender = _beforeRender;
    frame.afterRender = _afterRender;

    // init control bar
    frame_controlbar = new WM.PanelStructureElement();
    frame_controlbar.area = new Rectangle(0, 0, context.canvas.width, 24);
    frame.panels.add(frame_controlbar);

    // buttons on control bar
    buttons["add"] = new WM.IconButton(
        name: "Doc-Add",
        action: _createNewModel);

    buttons["del"] = new WM.IconButton(
        name: "Doc-Del",
        visible: false,
        action: _removeCurrentModel);

    buttons["clear"] = new WM.IconButton(
        name: "Trash",
        visible: false,
        action: _clearCurrentModel);

    buttons["mode"] = new WM.IconButton(
        name: "Overlay-edit",
        action: _toggleMode);

    buttons.forEach((name, button){
      frame_controlbar.elements.add(button);
    });

    // init models
    frame_toolbar = new WM.PanelStructureElement();
    frame_toolbar.area = new Rectangle(
        context.canvas.width - 250,
        frame_controlbar.area.height,
        250,
        context.canvas.height - frame_controlbar.area.height);
    frame.panels.add(frame_toolbar);

    // list of models
    frame_list = new WM.ListItems();
    frame_list.area = frame_toolbar.area;
    frame_toolbar.elements.add(frame_list);
    frame_list.onSelect.listen(_onModelChange);


    // worksapce panel
    frame_workspace = new WM.PanelStructureElement();
    frame_workspace.backgroundColor = [255, 255, 255];
    frame_workspace.area = new Rectangle(
        0,
        frame_controlbar.area.height,
        frame_list.area.left,
        frame_list.area.height);
    frame.panels.add(frame_workspace);

    workspace = new Workspace();
    workspace.area = frame_workspace.area;
    frame_workspace.elements.add(workspace);

  }

  _createNewModel() {
    Model model = new Model(modelsId++);
    models.add(model);
    frame_list.addItem(new WM.ListItem(model.id, "Model #${model.id}"));
  }

  _clearCurrentModel() {
    Model model = _getCurrentModel();

    if (model is Model) {
      model.points.clear();
      buttons["clear"].visible = false;
    }
  }

  _removeCurrentModel() {
    Model model = _getCurrentModel();

    if (model is Model) {
      models.remove(model);
      frame_list.removeItemById(model.id);
    }
  }

  _toggleMode() {

    List<String> icons = ["Overlay-edit", "Trend Up"];

    workspace.toggleMode();

    buttons["mode"].setIcon(name: icons[workspace.mode]);
  }

  _getCurrentModel() {
    if (frame_list.current is WM.ListItem) {
        return models.singleWhere((model){
          return model.id == frame_list.current.id;
        });
    }

    return null;
  }

  _onModelChange(WM.ListItem item) {
    workspace.model = _getCurrentModel();
  }

  _beforeRender() {
    Model current = _getCurrentModel();

    buttons["mode"].visible = models.length > 0;
    buttons["del"].visible = models.length > 0;
    buttons["clear"].visible =
        current is Model ? current.points.length > 0 : false;
  }

  _afterRender() {

  }

}




