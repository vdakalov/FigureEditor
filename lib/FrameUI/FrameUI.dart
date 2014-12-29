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

// structure elements
part "structure/RootStructureElement.dart";
part "structure/FrameStructureElement.dart";
part "structure/PlaceStructureElement.dart";
part "structure/PanelStructureElement.dart";
part "structure/ControlStructureElement.dart";

// base places
part "places/base/HorizontalPlace.dart";
part "places/base/VericalPlace.dart";

// places
part "places/TopPlace.dart";
part "places/LeftPlace.dart";
part "places/RightPlace.dart";
part "places/BottomPlace.dart";

// controls
part "controls/IconButton.dart";
part "controls/ListItems.dart";
part "controls/ListItem.dart";

class FrameUI {

  List<PanelStructureElement> panels = new List<PanelStructureElement>();
  CanvasRenderingContext2D context;

  Function beforeRender = (){};
  Function afterRender = (){};

  FrameUI(this.context) {

    context.canvas..onClick.listen(_onClick)
                  ..onMouseMove.listen(_onMouseMove)
                  ;

    _render(0);
  }

  _render(dynamic some) {
    context.clearRect(0, 0, context.canvas.width, context.canvas.height);
    beforeRender();
    panels.forEach((panel){
      panel.render(context);
    });
    afterRender();
    window.requestAnimationFrame(_render);
  }

  _onClick(MouseEvent event) {
    panels.forEach((panel){
      panel.elements.forEach((element){
        if (element.visible && element.area.containsPoint(event.offset)) {
          element.action(event.offset);
        }
      });
    });
  }

  _onMouseMove(MouseEvent event) {
    panels.forEach((panel){
      panel.elements
      .forEach((element){
        if (element.visible && element.area.containsPoint(event.offset)) {
          element.isHover = true;
          element.move(event.offset);
        } else if (element.isHover) {
          element.isHover = false;
        }
      });
    });
  }

}



