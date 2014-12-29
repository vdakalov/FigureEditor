part of FrameUI;

class FrameStructureElement extends SimpleStructureElement {

  RootStructureElement parent;
  List<PlaceStructureElement> _children = new List<PlaceStructureElement>();

  PlaceStructureElement top = new TopPlace();
  PlaceStructureElement left = new LeftPlace();
  PlaceStructureElement right = new RightPlace();
  PlaceStructureElement bottom = new BottomPlace();

  Rectangle area;

  Point get position =>
      area is Rectangle ? new Point(area.left, area.top) :
        parent is RootStructureElement ? parent.position : new Point(0, 0);

  Point get size =>
      area is Rectangle ? new Point(area.width, area.height) :
        parent is RootStructureElement ? parent.size : new Point(0, 0);

  FrameStructureElement() {

    top.parent = this;
    left.parent = this;
    right.parent = this;
    bottom.parent = this;

    _children = [left, right, bottom, top];
  }

}