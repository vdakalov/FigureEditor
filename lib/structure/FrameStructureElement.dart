part of FrameUI;

class FrameStructureElement extends SimpleStructureElement {

  RootStructureElement parent;
  List<PlaceStructureElement> _children = new List<PlaceStructureElement>();

  PlaceStructureElement top = new HorizontalPlace();
  PlaceStructureElement left = new VericalPlace();
  PlaceStructureElement right = new VericalPlace();
  PlaceStructureElement bottom = new HorizontalPlace();
//  PlaceStructureElement center = new PlaceStructureElement();

  int padding = 0;

  FrameStructureElement() {

    top.parent = this;
    left.parent = this;
    right.parent = this;
    bottom.parent = this;
//    center.parent = this;

    _children = [/*center,*/ left, right, bottom, top];

  }

  init() {
    top.area = new Rectangle(0, 0, area.width, 0);
    left.area = new Rectangle(0, 0, 0, area.height);
    right.area = new Rectangle(area.width, 0, 0, area.height);
    bottom.area = new Rectangle(0, area.height, area.width, 0);
//    center.area = new Rectangle(0, 0, area.width, area.height);
  }

  /**
   * Updating the position of Place if one of them resized
   *
   * auto run on place resizing
   */
  updateSize() {

    // WARNING! DO NOT CHANGE SIZE OF THE FRAME AREA HERE!

    top.area = new Rectangle(0, 0, area.width, top.area.height);

    left.area = new Rectangle(
        0,
        top.area.bottom,
        left.area.width,
        area.height - (top.area.height + bottom.area.height));

    right.area = new Rectangle(
        area.width - right.area.width,
        top.area.bottom,
        right.area.width,
        area.height - (top.area.height + bottom.area.height));

    bottom.area = new Rectangle(
        0,
        area.height - bottom.area.height,
        area.width,
        bottom.area.height);

  }

}