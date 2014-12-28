part of FrameUI;

class HorizontalPlace extends PlaceStructureElement {

  @override
  Rectangle get area =>
      new Rectangle(
          parent.area.left + parent.padding + _area.left,
          parent.area.top + parent.padding + _area.top,
          _area.width,
          _area.height + (padding * 2));


  updateSize() {
    int height = 0;
    _children.forEach((child){
      if (child.area.height > height) {
        height = child.area.height;
      }
    });

    size = new Point(size.x, height);
  }

}