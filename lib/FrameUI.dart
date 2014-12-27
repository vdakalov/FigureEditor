library FrameUI;

import "dart:html";
import "dart:async";

part "RenderingElement.dart";

part "places/Place.dart";

class FrameUI extends RenderingElement {

  CanvasRenderingContext2D context;

  bool rendering = false;

  init() {
    rendering = true;
    render(0);
  }

  refreshCanvas() {
    context.clearRect(0, 0, context.canvas.width, context.canvas.height);
  }

  render(dynamic some) {

    context..clearRect(
                 polygon.topLeft.x,
                 polygon.topLeft.y,
                 polygon.width,
                 polygon.height)

           ..beginPath()
           ..fillStyle = "rgb(240, 240, 240)"
           ..fillRect(
               polygon.topLeft.x,
               polygon.topLeft.y,
               polygon.width,
               polygon.height)
           ..fill()
           ..closePath()

           ..beginPath()

           ..strokeRect(
               polygon.topLeft.x,
               polygon.topLeft.y,
               polygon.width,
               polygon.height)
           ..strokeStyle = "rgb(160, 160, 160)"
           ..stroke()
           ..closePath();

    if (rendering) {
      window.requestAnimationFrame(render);
    }
  }

}









