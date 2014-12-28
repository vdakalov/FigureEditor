part of FrameUI;

class RootStructureElement extends SimpleStructureElement {

  List<FrameStructureElement> _children = new List<FrameStructureElement>();

  int padding = 0;

  @override
  Rectangle get area => _area;

  @override
  void set area(Rectangle rect) {
    _area = rect;
  }

  Point get position => new Point(area.left, area.top);
  void set position(Point pos) {
    area = new Rectangle(pos.x, pos.y, area.width, area.height);
  }

  Point get size => new Point(area.width, area.height);
  void set size(Point size) {
    area = new Rectangle(area.left, area.top, size.x, size.y);
    updateSize();
  }

  add(FrameStructureElement frame) {
    frame.parent = this;
    frame.area = area;
    frame.init();
    _children.add(frame);
  }

  updateSize() {

    _children.forEach((frame){
      frame.area = area;
      frame.updateSize();
    });

  }

  render(CanvasRenderingContext2D context) {
    // without parent element rendering only children
    _children.forEach((frame){
      frame.render(context);
    });
  }

}