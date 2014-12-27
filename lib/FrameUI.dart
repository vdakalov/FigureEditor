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

class FrameUI {

  RootRenderingElement _root;

  CanvasRenderingContext2D context;

  List<Frame> _frames = new List<Frame>();

  FrameUI(this.context) {
    _root = new RootRenderingElement();
    update();
    _render(0);
  }

  _render(dynamic some) {

    _frames.forEach((frame){
      frame.render(context);
    });

    window.requestAnimationFrame(_render);
  }

  add(Frame frame) {
    frame.parent = _root;
    frame.polygon = _root.polygon;
    frame.init();
    _frames.add(frame);
  }

  update() {
    _root.polygon = new Rectangle(
       0, 0, context.canvas.width, context.canvas.height);
  }
}

class RootRenderingElement extends SimpleRenderingElement {
  render(CanvasRenderingContext2D context) {}
}



