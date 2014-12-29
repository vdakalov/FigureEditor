part of FrameUI;

abstract class IControlStructureElement {
  Rectangle area;
  bool isHover;
  bool isActive;
  bool visible;
  String cursor;
  action(Point point);
  mouseMove(Point point);
  mouseUp(Point point);
  mouseDown(Point point);
  render(CanvasRenderingContext2D context);
}