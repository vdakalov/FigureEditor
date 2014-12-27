part of FrameUI;

class Panel extends SimpleRenderingElement {

  List<SimpleRenderingElement> _children = new List<SimpleRenderingElement>();
  int padding = 2;

  add(SimpleRenderingElement element) {

    element.parent = this;
    _children.add(element);

    if (element is IconElement) {
      element.icon.onLoad.listen((Event event){
        updatePanelChildren();
        updatePanelRectangle();
      });
    } else {
      updatePanelChildren();
      updatePanelRectangle();
    }

  }

  updatePanelChildren() {
    for (int index = 0; index < _children.length; index++) {
      updatePanelChild(_children.elementAt(index), index);
    }
  }

  updatePanelChild(SimpleRenderingElement element, int index) {

    Point offset = new Point(polygon.left + padding, polygon.top + padding);
    int placement =
        parent is TopPlace || parent is BottomPlace ?
            FRAMEUI_PLACEMENT_HORIZONTAL : FRAMEUI_PLACEMENT_VERTICAL;

    if (index > 0) {
      SimpleRenderingElement prev = _children.elementAt(index - 1);
      offset = placement == FRAMEUI_PLACEMENT_HORIZONTAL ?
          new Point(prev.polygon.right, prev.polygon.top) :
          new Point(prev.polygon.left, prev.polygon.bottom);
    }

    element.polygon = new Rectangle(
        offset.x,
        offset.y,
        element.polygon.width,
        element.polygon.height);
  }

  updatePanelRectangle() {
    int width = 0, height = 0, placement =
        parent is TopPlace || parent is BottomPlace ?
                    FRAMEUI_PLACEMENT_HORIZONTAL : FRAMEUI_PLACEMENT_VERTICAL;

    _children.forEach((element){
      width = element.polygon.width > width ? element.polygon.width : width;
      height = element.polygon.height > height ? element.polygon.height : height;
    });

    if (placement == FRAMEUI_PLACEMENT_HORIZONTAL) {
      polygon = new Rectangle(
          polygon.left,
          polygon.top,
          _children.last.polygon.right + (padding * 2),
          height + (padding * 2));
    } else {
      polygon = new Rectangle(
          polygon.left,
          polygon.top,
          polygon.width + (padding * 2),
          _children.last.polygon.bottom + (padding * 2));
    }

  }

  render(CanvasRenderingContext2D context) {

    _children.forEach((element){
      element.render(context);
    });

  }

}




