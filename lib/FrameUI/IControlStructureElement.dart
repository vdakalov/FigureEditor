part of FrameUI;

abstract class IControlStructureElement {
  Rectangle area;
  bool isHover;
  bool visible;
  action(Point point);
  move(Point point);
  render(CanvasRenderingContext2D context);
}