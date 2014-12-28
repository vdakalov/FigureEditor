part of FrameUI;

class SimpleStructureElement implements IStructureElement, IInteractiveElement {

  @override
  SimpleStructureElement parent;

  @override
  List<SimpleStructureElement> _children;

  @override
  bool isHover = false;

  int padding = 0;

  Rectangle _area = new Rectangle(0, 0, 0, 0);

  @override
  Rectangle get area =>
      new Rectangle(
          parent.area.left + parent.padding + _area.left,
          parent.area.top + parent.padding + _area.top,
          _area.width + (padding * 2),
          _area.height + (padding * 2));

  @override
  void set area(Rectangle rect) {
    _area = new Rectangle(
        rect.left - (parent.area.left + parent.padding),
        rect.top - (parent.area.top + parent.padding),
        rect.width,
        rect.height);
  }

  Point get position =>
      new Point(_area.left, _area.top);

  void set position(Point pos) {
    area = new Rectangle(pos.x, pos.y, area.width, area.height);
  }

  Point get size => new Point(area.width, area.height);
  void set size(Point size) {
    area = new Rectangle(area.left, area.top, size.x, size.y);
    parent.updateSize();
  }

  List<int> backgroundColor = [220, 220, 220, 1];

  render(CanvasRenderingContext2D context) {
    _children.forEach((child){
      child.render(context);
    });
  }

  init() {

  }

  add(SimpleStructureElement child) {
    child.parent = this;
    child.init();
    _children.add(child);
    updateSize();
  }

  updateSize() {

  }

  @override
  onClick(MouseEvent event) {
    _children.forEach((child){
      if (child.area.containsPoint(event.offset)) {
        if (child.triggerClick(event)) {
          child.onClick(event);
        }
      }
    });
  }

  @override
  onKeyDown(KeyboardEvent event) {
    _children.forEach((child){
      if (child.triggerKeyDown(event)) {
        child.onKeyDown(event);
      }
    });
  }

  @override
  onKeyPress(KeyboardEvent event) {
    _children.forEach((child){
      if (child.triggerKeyPress(event)) {
        child.onKeyPress(event);
      }
    });
  }

  @override
  onKeyUp(KeyboardEvent event) {
    _children.forEach((child){
      if (child.triggerKeyUp(event)) {
        child.onKeyUp(event);
      }
    });
  }

  @override
  onMouseDown(MouseEvent event) {
    _children.forEach((child){
      if (child.area.containsPoint(event.offset)) {
        if (child.triggerMouseDown(event)) {
          child.onMouseDown(event);
        }
      }
    });
  }

  @override
  onMouseMove(MouseEvent event) {
    _children.forEach((child){

      if (child.triggerMouseMove(event)) {
        child.onMouseMove(event);
      }

      if (child.area.containsPoint(event.offset)) {
        if (!child.isHover) {
          child.isHover = true;
          child.triggerMouseEnter(event);
        }
        child.triggerMouseOver(event);
      } else if (child.isHover) {
        child.isHover = false;
        child.triggerMouseOut(event);
      }
    });
  }

  @override
  onMouseUp(MouseEvent event) {
    _children.forEach((child){
      if (child.area.containsPoint(event.offset)) {
        if (child.triggerMouseUp(event)) {
          child.onMouseUp(event);
        }
      }
    });
  }

  @override
  onMouseEnter(MouseEvent event) {
    _children.forEach((child){
      if (child.area.containsPoint(event.offset)) {
        if (child.triggerMouseUp(event)) {
          child.onMouseUp(event);
        }
      }
    });
  }

  @override
  onMouseOut(MouseEvent event) {
    _children.forEach((child){
      if (child.area.containsPoint(event.offset)) {
        if (child.triggerMouseUp(event)) {
          child.onMouseUp(event);
        }
      }
    });
  }

  @override
  bool triggerClick(MouseEvent event) {
    return true;
  }

  @override
  bool triggerKeyDown(KeyboardEvent event) {
    return true;
  }

  @override
  bool triggerKeyPress(KeyboardEvent event) {
    return true;
  }

  @override
  bool triggerKeyUp(KeyboardEvent event) {
    return true;
  }

  @override
  bool triggerMouseDown(MouseEvent event) {
    return true;
  }

  @override
  bool triggerMouseMove(MouseEvent event) {
    return true;
  }

  @override
  bool triggerMouseUp(MouseEvent event) {
    return true;
  }

  @override
  bool triggerMouseEnter(MouseEvent event) {
    return true;
  }

  @override
  bool triggerMouseOut(MouseEvent event) {
    return true;
  }

  @override
  bool triggerMouseOver(MouseEvent event) {
    return true;
  }

}