part of FrameUI;

class Panel extends SimpleRenderingElement {

  List<Element> _children = new List<Element>();

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
        offset.x, offset.y, element.polygon.width, element.polygon.height);

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
          polygon.left, polygon.top, _children.last.polygon.right, height);
    } else {
      polygon = new Rectangle(
          polygon.left,
          polygon.top,
          polygon.width,
          _children.last.polygon.bottom);
    }

  }

  render(CanvasRenderingContext2D context) {

    _children.forEach((element){
      element.render(context);
    });

  }

}




