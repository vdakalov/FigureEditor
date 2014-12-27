
import "dart:html";
import "package:FrameUI/FrameUI.dart";

main() {

  FrameUI frame = new FrameUI();

  document.body.append(frame.context.canvas);

  frame.polygon = new Rectangle(10, 10, 760, 500);
  frame.refreshCanvas();

}