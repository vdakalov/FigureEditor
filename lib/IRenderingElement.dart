part of FrameUI;

abstract class IRenderingElement {
  Rectangle area;
  render(CanvasRenderingContext2D context);
}