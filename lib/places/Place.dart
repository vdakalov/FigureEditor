part of FrameUI;

class Place extends RenderingElement {

  List<dynamic> panels = new List<dynamic>();

  Place(width, height): super(width: width, height: height);
  Place.fromContext(context): super.fromContext(context);

  render() {

    context..fillStyle = "rgb(220, 180, 180)"
           ..fillRect(polygon.left, polygon.top, polygon.width, polygon.height);

  }

}