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

    // init control bar
    frame_controlbar = new WM.PanelStructureElement();
    frame_controlbar.area = new Rectangle(0, 0, context.canvas.width, 20);
    frame.panels.add(frame_controlbar);

    // buttons on control bar
    frame_controlbar.elements.add(
        new WM.IconButton(name: "Doc-Add", action: _createNewModel));

    frame_controlbar.elements.add(
        new WM.IconButton(name: "Doc-Del", action: _removeCurrentModel));

    frame_controlbar.elements.add(
        new WM.IconButton(name: "Trash", action: _clearCurrentModel));

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
    }
  }

  _removeCurrentModel() {
    Model model = _getCurrentModel();

    if (model is Model) {
      models.remove(model);
      frame_list.removeItemById(model.id);
    }
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













}






