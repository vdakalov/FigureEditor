part of FrameUI;

class SimpleRenderingElement implements RenderingElement {

  SimpleRenderingElement parent;

  // placement
  Rectangle _polygon = new Rectangle(0, 0, 0, 0);

  // stream for watch polygon changes
  StreamController _onPolygonChange = new StreamController<Rectangle>();
  Stream get onPolygonChange => _onPolygonChange.stream;

  // polygon getter and setter
  Rectangle get polygon => _polygon;

  void set polygon(Rectangle polygon) {
   _polygon = polygon;
   _onPolygonChange.add(_polygon);
  }

  @override
  render(CanvasRenderingContext2D context) {
    context
        ..fillStyle = "rgb(220, 220, 220)"
        ..fillRect(polygon.left, polygon.top, polygon.width, polygon.height);
  }

}

abstract class RenderingElement {
  render(CanvasRenderingContext2D context);
}