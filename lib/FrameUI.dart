library FrameUI;

import "dart:html";
import "dart:async";

part "RenderingElement.dart";
part "Button.dart";

part "Place.dart";
part "Panel.dart";

class FrameUI extends RenderingElement {

  CanvasRenderingContext2D context;

  bool rendering = false;

  List<Place> places = new List<Place>();

  FrameUI(): super(width: null, height: null);
  FrameUI.fromContext(context): super.fromContext(context);

  init() {
    rendering = true;
    render(0);
  }

  add(Place place) {
    places.add(place);
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

    places.forEach((place){
      place.render();
    });

    if (rendering) {
      window.requestAnimationFrame(render);
    }
  }

}









