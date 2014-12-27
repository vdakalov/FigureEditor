part of FrameUI;

class Panel extends RenderingElement {

  Panel(width, height): super(width: width, height: height);
  Panel.fromContext(context): super.fromContext(context);

  List<Button> _elements = new List<Button>();

  int placement;

  add(Button element) {

    Point offset = new Point(polygon.left, polygon.top);

    if (_elements.length > 0) {
      offset = new Point(
          _elements.last.polygon.left, _elements.last.polygon.top);
    }

    _elements.add(element);
    element.polygon = new Rectangle(
        offset.x, offset.y, element.polygon.width, element.polygon.height);
    element.onPolygonUpdate.listen(_updatePanelRectangle);
  }

  _updatePanelRectangle(Rectangle _) {
    int width = 0, height = 0;
    _elements.forEach((element){
      width = element.polygon.width > width ? element.polygon.width : width;
      height = element.polygon.height > height ? element.polygon.height : height;
    });

    if (placement == FRAMEUI_PLACEMENT_HORIZONTAL) {
      polygon = new Rectangle(polygon.left, polygon.top, polygon.width, height);
    } else if (placement == FRAMEUI_PLACEMENT_VERTICAL) {
      polygon = new Rectangle(polygon.left, polygon.top, width, polygon.height);
    }
  }

  render() {

    _elements.forEach((element){
      element.render();
    });

  }

}