part of FrameUI;

class Place extends RenderingElement {

  List<dynamic> panels = new List<dynamic>();

  Place(width, height): super(width: width, height: height);
  Place.fromContext(context): super.fromContext(context);

  List<int> color = new List<int>(3);

  render() {

    context..fillStyle = "rgb(${color[0]}, ${color[1]}, ${color[2]})"
           ..fillRect(polygon.left, polygon.top, polygon.width, polygon.height);

  }

}