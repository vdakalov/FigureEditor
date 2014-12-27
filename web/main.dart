
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

  frame.top.polygon = new Rectangle(0, 0, canvas.width, 20);
  frame.left.polygon = new Rectangle(0, 20, 20, canvas.height - 40);
  frame.right.polygon = new Rectangle(canvas.width - 20, 20, 20, canvas.height - 40);
  frame.bottom.polygon = new Rectangle(0, canvas.height - 20, canvas.width, 20);

  new Timer(new Duration(seconds: 10), (){
    canvas.setAttribute("width", "1000");
    canvas.setAttribute("height", "800");
    frameUI.update();
  });

}