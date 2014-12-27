
import "dart:html";
import "package:FrameUI/FrameUI.dart";

main() {

  FrameUI frame = new FrameUI();

  document.body.append(frame.context.canvas);

  frame.polygon = new Rectangle(10, 10, 500, 300);
  frame.refreshCanvas();

  Place top = new Place.fromContext(frame.context);
  top.placement = FRAMEUI_PLACEMENT_HORIZONTAL;
  top.position = FRAMEUI_POSITION_TOP;

  Panel control = new Panel.fromContext(frame.context);
  Button open = new Button.fromContext(frame.context);

  control.add(open);
  top.add(control);
  frame.add(top);



//  places["top"] = new Place.fromContext(context);
//  places["top"].placement = FRAMEUI_PLACEMENT_HORIZONTAL;
//  places["top"].color = [225, 225, 225];
//  places["top"].polygon = new Rectangle(
//      0, 0, polygon.width, defaultPlaceSize);
//
//  places["bottom"] = new Place.fromContext(context);
//  places["bottom"].placement = FRAMEUI_PLACEMENT_HORIZONTAL;
//  places["bottom"].color = [225, 225, 225];
//  places["bottom"].polygon = new Rectangle(
//      0, 0, polygon.width, defaultPlaceSize);
//
//  places["left"] = new Place.fromContext(context);
//  places["left"].placement = FRAMEUI_PLACEMENT_VERTICAL;
//  places["left"].color = [210, 210, 210];
//  places["left"].polygon = new Rectangle(
//      0, 0, defaultPlaceSize, polygon.height - (defaultPlaceSize * 2));
//
//  places["right"] = new Place.fromContext(context);
//  places["right"].placement = FRAMEUI_PLACEMENT_VERTICAL;
//  places["right"].color = [210, 210, 210];
//  places["right"].polygon = new Rectangle(
//      0, 0, defaultPlaceSize, polygon.height - (defaultPlaceSize * 2));

}