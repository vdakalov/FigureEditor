
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



  new Timer(new Duration(seconds: 10), (){
    canvas.setAttribute("width", "1000");
    canvas.setAttribute("height", "800");
    frameUI.update();
  });

}