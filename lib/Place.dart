part of FrameUI;

class Place extends SimpleRenderingElement {

  List<Panel> _children = new List<Panel>();
  List<int> backgroundColor = [225, 225, 225];

  add(Panel panel) {
    panel.parent = this;
    panel.onPolygonChange.listen(updatePolygon);
    _children.add(panel);
  }

  updatePolygon(Rectangle _) {

    int width = 0, height = 0;

    _children.forEach((panel){
      width = panel.polygon.width > width ? panel.polygon.width : width;
      height = panel.polygon.height > height ? panel.polygon.height : height;
    });

    if (this is TopPlace) {
      polygon = new Rectangle(polygon.left, polygon.top, polygon.width, height);

    } else if (this is LeftPlace) {
      polygon = new Rectangle(polygon.left, polygon.top, width, polygon.height);

    } else if (this is RightPlace) {
      polygon = new Rectangle(
          parent.polygon.width - width, polygon.top, width, polygon.height);

    } else if (this is BottomPlace) {
      polygon = new Rectangle(
          polygon.left, parent.polygon.height - height, polygon.width, height);
    }

  }

  render(CanvasRenderingContext2D context) {

    super.render(context);

    _children.forEach((panel){
      panel.render(context);
    });
  }

}