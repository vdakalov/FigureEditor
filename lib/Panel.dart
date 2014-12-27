part of FrameUI;

class Panel extends SimpleRenderingElement {

  List<Element> _children = new List<Element>();

  add(Element element) {

    Point offset = new Point(polygon.left, polygon.top);

    if (_children.length > 0) {
      offset = new Point(
          _children.last.polygon.left, _children.last.polygon.top);
    }

    _children.add(element);
    element.polygon = new Rectangle(
        offset.x, offset.y, element.polygon.width, element.polygon.height);
  }

  _updatePanelRectangle(Rectangle _) {
    int width = 0, height = 0;
    _children.forEach((element){
      width = element.polygon.width > width ? element.polygon.width : width;
      height = element.polygon.height > height ? element.polygon.height : height;
    });
  }

  render(CanvasRenderingContext2D context) {

    _children.forEach((element){
      element.render(context);
    });

  }

}


class Element extends SimpleRenderingElement {

}



