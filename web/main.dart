
import "dart:html";
import "dart:async";
import "package:FrameUI/FrameUI.dart";

main() {

  CanvasElement canvas = new CanvasElement(width: 500, height: 500);
  CanvasRenderingContext2D context = canvas.getContext("2d");
  document.body.append(canvas);
  canvas.tabIndex = 1;
  canvas.focus();

  FrameUI frameUI = new FrameUI(context);

  Frame frame = new Frame();
  frameUI.add(frame);

  // left
  Panel tools = new Panel();
  frame.left.add(tools);

  Button add = new Button();
  tools.add(add);

  add.setIcon(name: "Add");
  add.onAction.listen((Point point){
    print("Add");
  });

  // top
  Panel controls = new Panel();
  frame.top.add(controls);

  Button open = new Button();
  controls.add(open);

  open.setIcon(name: "Doc-Add");
  open.onAction.listen((Point point){
    print("Add new");
  });

  Button save = new Button();
  controls.add(save);

  save.setIcon(name: "Save");
  save.onAction.listen((Point point){
    print("Save");
  });



  new Timer(new Duration(seconds: 4), (){
    canvas.setAttribute("width", "1000");
    canvas.setAttribute("height", "800");
    frameUI.update();
  });

}