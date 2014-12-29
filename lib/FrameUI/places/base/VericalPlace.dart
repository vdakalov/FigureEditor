part of FrameUI;

class VericalPlace extends PlaceStructureElement {

  @override
  Rectangle get area =>
      new Rectangle(
          0,
          0,
          0,
          parent.area.height);

}