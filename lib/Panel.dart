part of FrameUI;

class Panel extends SimpleRenderingElement {

  List<Element> _children = new List<Element>();
  int padding = 2;

  add(Element element) {

    Point offset = new Point(polygon.left, polygon.top);
    int placement =
        parent is TopPlace || parent is BottomPlace ?
            FRAMEUI_PLACEMENT_HORIZONTAL : FRAMEUI_PLACEMENT_VERTICAL;

    if (_children.length > 0) {
      offset = placement == FRAMEUI_PLACEMENT_HORIZONTAL ?
          new Point(_children.last.polygon.right, _children.last.polygon.top) :
          new Point(_children.last.polygon.left, _children.last.polygon.bottom);
    }

    element.parent = this;
    element.polygon = new Rectangle(
        offset.x + padding,
        offset.y + padding,
        element.polygon.width,
        element.polygon.height);

    _children.add(element);

    if (element is IconElement) {
      element.icon.onLoad.listen((Event event){
        updatePanelRectangle();
      });
    } else {
      updatePanelRectangle();
    }

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




