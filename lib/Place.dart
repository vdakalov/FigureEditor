part of FrameUI;

class Place extends SimpleRenderingElement {

  List<Panel> _children = new List<Panel>();
  List<int> backgroundColor = [220, 220, 220];

  render(CanvasRenderingContext2D context) {
    context..fillStyle = "rgb(${backgroundColor.join(", ")})"
           ..fillRect(polygon.left, polygon.top, polygon.width, polygon.height);
  }

}