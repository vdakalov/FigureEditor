part of FrameUI;

class HorizontalPlace extends PlaceStructureElement {

  @override
  Rectangle get area =>
      new Rectangle(
          0,
          0,
          parent.area.width,
          0);


}