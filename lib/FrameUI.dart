library FrameUI;

import "dart:html";

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
part "structure/ControlStructureElement.dart";

// places
part "places/HorizontalPlace.dart";
part "places/VericalPlace.dart";

// controls
part "controls/IconButton.dart";

class FrameUI {

  RootStructureElement frames;

  CanvasRenderingContext2D context;

  FrameUI(this.context) {
    frames = new RootStructureElement();

    context.canvas..onResize.listen((Event event){update();})
                  ..onClick.listen(frames.onClick)
                  ..onMouseMove.listen(frames.onMouseMove)
                  ..onMouseDown.listen(frames.onMouseDown)
                  ..onMouseUp.listen(frames.onMouseUp)
                  ..onKeyDown.listen(frames.onKeyDown)
                  ..onKeyPress.listen(frames.onKeyPress)
                  ..onKeyUp.listen(frames.onKeyUp);

    update();
    _render(0);
  }

  _render(dynamic some) {
    frames.render(context);
    window.requestAnimationFrame(_render);
  }

  update() {
    frames.size = new Point(context.canvas.width, context.canvas.height);
  }

}



