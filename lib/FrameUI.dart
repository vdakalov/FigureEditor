library FrameUI;

import "dart:html";
import "dart:async";

// interfaces
part "IRenderingElement.dart";
part "IStructureElement.dart";
part "IInteractiveElement.dart";
part "IControlStructureElement.dart";

// base class for structure elements
part "structure/base/SimpleStructureElement.dart";
part "structure/base/DisplayedStructureElement.dart";

// structure elements
part "structure/RootStructureElement.dart";
part "structure/FrameStructureElement.dart";
part "structure/PlaceStructureElement.dart";
part "structure/PanelStructureElement.dart";

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

  RootStructureElement _root;

  CanvasRenderingContext2D context;

  FrameUI(this.context) {
    _root = new RootStructureElement();

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

  add(FrameStructureElement frame) {
    frame.parent = _root;
    frame.area = _root.area;
    _root._children.add(frame);
  }

  _render(dynamic some) {
    _root.render(context);
    window.requestAnimationFrame(_render);
  }

  update() {
    _root.area = new Rectangle(
       0, 0, context.canvas.width, context.canvas.height);
  }

}



