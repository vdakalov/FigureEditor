library FrameUI;

import "dart:html";
import "dart:async";

part "RenderingElement.dart";

part "places/Place.dart";

class FrameUI extends RenderingElement {

  CanvasRenderingContext2D context;

  bool rendering = false;

  Map<String, Place> places = new Map<String, Place>();

  FrameUI(): super(width: null, height: null);
  FrameUI.fromContext(context): super.fromContext(context);

  init() {
    rendering = true;
    render(0);

    initPlaces();
  }

  initPlaces() {

    int defaultPlaceSize = 20;

    // create polygons and defined sizes (without positions)

    places["top"] = new Place.fromContext(context);
    places["top"].color = [225, 225, 225];
    places["top"].polygon = new Rectangle(
        0, 0, polygon.width, defaultPlaceSize);

    places["bottom"] = new Place.fromContext(context);
    places["bottom"].color = [225, 225, 225];
    places["bottom"].polygon = new Rectangle(
        0, 0, polygon.width, defaultPlaceSize);


    places["left"] = new Place.fromContext(context);
    places["left"].color = [210, 210, 210];
    places["left"].polygon = new Rectangle(
        0, 0, defaultPlaceSize, polygon.height - (defaultPlaceSize * 2));

    places["right"] = new Place.fromContext(context);
    places["right"].color = [210, 210, 210];
    places["right"].polygon = new Rectangle(
        0, 0, defaultPlaceSize, polygon.height - (defaultPlaceSize * 2));


    updatePlaces();
  }

  updatePlaces() {
    int defaultPlaceSize = 20;

    // top place
    places["top"].polygon = new Rectangle(
        polygon.left,
        polygon.top,
        polygon.width,
        places["top"].polygon.height);

    // bottom place
    places["bottom"].polygon = new Rectangle(
        polygon.left,
        polygon.bottom - places["bottom"].polygon.height,
        polygon.width,
        places["bottom"].polygon.height);

    // left place
    places["left"].polygon = new Rectangle(
        polygon.left,
        places["top"].polygon.bottom,
        places["left"].polygon.width,
        polygon.height -
          (places["top"].polygon.height + places["bottom"].polygon.height));

    // right place
    places["right"].polygon = new Rectangle(
        polygon.right - places["right"].polygon.width,
        places["top"].polygon.bottom,
        places["right"].polygon.width,
        polygon.height -
          (places["top"].polygon.height + places["bottom"].polygon.height));
  }

  refreshCanvas() {
    context.clearRect(0, 0, context.canvas.width, context.canvas.height);
    updatePlaces();
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

    places.forEach((name, place){
      place.render();
    });

    if (rendering) {
      window.requestAnimationFrame(render);
    }
  }

}









