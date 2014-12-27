part of FrameUI;

abstract class Panel implements RenderingElement {

  render(CanvasRenderingContext2D context) {

    context..fillStyle = "rgb(110, 110, 110)"
           ..fillRect(
               polygon.topLeft.x,
               polygon.topLeft.y,
               polygon.width,
               polygon.height);

  }

}