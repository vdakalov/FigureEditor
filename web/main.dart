
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

  FrameStructureElement frame = new FrameStructureElement();
  frameUI.frames.add(frame);

  // top frame
  PanelStructureElement controls = new PanelStructureElement();
  frame.top.add(controls);

  IconButton open = new IconButton.fromIcon(name: "Doc-Add");
  controls.add(open);

  // left
  PanelStructureElement tools = new PanelStructureElement();
  frame.left.add(tools);

  IconButton add = new IconButton.fromIcon(name: "Add");
  tools.add(add);

  // right
  PanelStructureElement help = new PanelStructureElement();
  frame.right.add(help);

  IconButton chart = new IconButton.fromIcon(name: "Chart1");
  help.add(chart);

  // bottom
  PanelStructureElement status = new PanelStructureElement();
  frame.bottom.add(status);

  IconButton success = new IconButton.fromIcon(name: "Ok");
  status.add(success);

  new Timer(new Duration(seconds: 4), (){
    canvas.setAttribute("width", "1000");
    canvas.setAttribute("height", "800");
    frameUI.update();
  });

}