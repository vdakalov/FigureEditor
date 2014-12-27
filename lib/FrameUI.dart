library FrameUI;

import "dart:html";
import "dart:async";

part "RenderingElement.dart";
part "Frame.dart";
part "Place.dart";
part "places/TopPlace.dart";
part "places/LeftPlace.dart";
part "places/RightPlace.dart";
part "places/BottomPlace.dart";
part "places/CenterPlace.dart";
part "Panel.dart";
part "Element.dart";
part "elements/Button.dart";

class FrameUI {

  RootRenderingElement _root;

  CanvasRenderingContext2D context;

  FrameUI(this.context) {
    _root = new RootRenderingElement();

    context.canvas..onClick.listen(_root.onClick)
                  ..onMouseMove.listen(_root.onMouseMove)
                  ..onMouseDown.listen(_root.onMouseDown)
                  ..onMouseUp.listen(_root.onMouseUp)
                  ..onKeyDown.listen(_root.onKeyDown)
                  ..onKeyPress.listen(_root.onKeyPress)
                  ..onKeyUp.listen(_root.onKeyUp);


    update();
    _render(0);
  }

  add(Frame frame) {
    frame.parent = _root;
    frame.polygon = _root.polygon;
    frame.init();
    _root._children.add(frame);
  }

  _render(dynamic some) {
    _root.render(context);
    window.requestAnimationFrame(_render);
  }

  update() {
    _root.polygon = new Rectangle(
       0, 0, context.canvas.width, context.canvas.height);
  }

}

class RootRenderingElement extends SimpleRenderingElement {

  List<Frame> _children = new List<Frame>();

  render(CanvasRenderingContext2D context) {
    _children.forEach((frame){
      frame.render(context);
    });
  }
}



