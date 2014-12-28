part of FrameUI;

class VericalPlace extends PlaceStructureElement {

  @override
  Rectangle get area =>
      new Rectangle(
          parent.area.left + parent.padding + _area.left,
          parent.area.top + parent.padding + _area.top,
          _area.width + (padding * 2),
          _area.height);


  updateSize() {
    int width = 0;
    _children.forEach((child){
      if (child.area.width > width) {
        width = child.area.width;
      }
    });

    size = new Point(width, size.y);
  }

}