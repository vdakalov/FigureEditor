part of FrameUI;

abstract class IControlStructureElement {
  Rectangle area;
  action(Point point);
  render(CanvasRenderingContext2D context);
}