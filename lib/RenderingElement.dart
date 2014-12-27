part of FrameUI;

const MOUSE_LEFT = 1;
const MOUSE_CENTER = 2;
const MOUSE_RIGHT = 3;

class SimpleRenderingElement implements StructureElement {

  SimpleRenderingElement parent;
  List<StructureElement> _children;

  // placement
  Rectangle _polygon = new Rectangle(0, 0, 0, 0);

  // stream for watch polygon changes
  StreamController _onPolygonChange = new StreamController<Rectangle>();
  Stream get onPolygonChange => _onPolygonChange.stream;

  // polygon getter and setter
  Rectangle get polygon => _polygon;

  bool isHover = false;

  void set polygon(Rectangle polygon) {
   _polygon = polygon;
   _onPolygonChange.add(_polygon);
  }

  @override
  render(CanvasRenderingContext2D context) {
    context
        ..fillStyle = "rgb(220, 220, 220)"
        ..fillRect(polygon.left, polygon.top, polygon.width, polygon.height);
  }

  onClick(MouseEvent event) {
    _children.forEach((child){
      if (child.polygon.containsPoint(event.offset)) {
        if (child.triggerClick(event)) {
          child.onClick(event);
        }
      }
    });
  }
  onMouseMove(MouseEvent event) {
    _children.forEach((child){
      if (child.polygon.containsPoint(event.offset)) {
        child.isHover = true;
        if (child.triggerMouseMove(event)) {
          child.onMouseMove(event);
        }
      } else if (child.isHover) {
        child.isHover = false;
      }
    });
  }
  onMouseUp(MouseEvent event) {
    _children.forEach((child){
      if (child.polygon.containsPoint(event.offset)) {
        if (child.triggerMouseUp(event)) {
          child.onMouseUp(event);
        }
      }
    });
  }
  onMouseDown(MouseEvent event) {
    _children.forEach((child){
      if (child.polygon.containsPoint(event.offset)) {
        if (child.triggerMouseDown(event)) {
          child.onMouseDown(event);
        }
      }
    });
  }

  onKeyPress(KeyboardEvent event) {
    _children.forEach((child){
      if (child.triggerKeyPress(event)) {
        child.onKeyPress(event);
      }
    });
  }
  onKeyDown(KeyboardEvent event) {
    _children.forEach((child){
      if (child.triggerKeyDown(event)) {
        child.onKeyDown(event);
      }
    });
  }
  onKeyUp(KeyboardEvent event) {
    _children.forEach((child){
      if (child.triggerKeyUp(event)) {
        child.onKeyUp(event);
      }
    });
  }

  bool triggerClick(MouseEvent event) { return true; }
  bool triggerMouseMove(MouseEvent event) { return true; }
  bool triggerMouseUp(MouseEvent event) { return true; }
  bool triggerMouseDown(MouseEvent event) { return true; }

  bool triggerKeyPress(KeyboardEvent event) { return true; }
  bool triggerKeyDown(KeyboardEvent event) { return true; }
  bool triggerKeyUp(KeyboardEvent event) { return true; }

}

abstract class StructureElement implements InteractiveElement, RenderingElement {

  StructureElement parent;
  List<InteractiveElement> _children;

  onClick(MouseEvent event);
  onMouseMove(MouseEvent event);
  onMouseUp(MouseEvent event);
  onMouseDown(MouseEvent event);

  onKeyPress(KeyboardEvent event);
  onKeyDown(KeyboardEvent event);
  onKeyUp(KeyboardEvent event);

}

abstract class InteractiveElement {

  bool triggerClick(MouseEvent event);
  bool triggerMouseMove(MouseEvent event);
  bool triggerMouseUp(MouseEvent event);
  bool triggerMouseDown(MouseEvent event);

  bool triggerKeyPress(KeyboardEvent event);
  bool triggerKeyDown(KeyboardEvent event);
  bool triggerKeyUp(KeyboardEvent event);

}

abstract class RenderingElement {
  render(CanvasRenderingContext2D context);
}