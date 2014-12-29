library FrameUI;

import "dart:html";
import "dart:async";

// interfaces
part "IControlStructureElement.dart";

// structure elements
part "structure/PanelStructureElement.dart";

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
                  ..onMouseDown.listen(_onMouseDown)
                  ..onMouseUp.listen(_onMouseUp)
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
          element.mouseMove(event.offset);
          document.body.style.cursor = element.cursor;
        } else if (element.isHover) {
          element.isHover = false;
        }
      });
    });
  }

  _onMouseDown(MouseEvent event) {
    panels.forEach((panel){
      panel.elements.forEach((element){
        if (element.visible && element.area.containsPoint(event.offset)) {
          element.isActive = true;
          element.mouseDown(event.offset);
        } else if (element.isActive) {
          element.isActive = false;
        }
      });
    });
  }

  _onMouseUp(MouseEvent event) {
    panels.forEach((panel){
      panel.elements.forEach((element){
        if (element.visible && element.area.containsPoint(event.offset)) {
          element.isActive = false;
          element.mouseUp(event.offset);
        }
      });
    });
  }

}



