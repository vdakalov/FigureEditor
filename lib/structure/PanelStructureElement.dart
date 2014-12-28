part of FrameUI;

class PanelStructureElement extends DisplayedStructureElement {

  PlaceStructureElement parent;
  List<SimpleStructureElement> _children =
      new List<SimpleStructureElement>();

  int padding = 2;

  updateSize() {

    int width = area.width, height = area.height;

    _children.forEach((child){
      if (parent is HorizontalPlace && child.area.height > height) {
        height = child.area.height;
      } else if (parent is VericalPlace && child.area.width > width) {
        width = child.area.width;
      }
    });

    size = new Point(width, height);

  }

}