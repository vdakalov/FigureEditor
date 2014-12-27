part of FrameUI;

class Button extends SimpleRenderingElement implements IconElement {

  List<SimpleRenderingElement> _children = new List<SimpleRenderingElement>();

  ImageElement icon = new ImageElement();
  Point offset = new Point(0, 0);

  StreamController<Point> _onAction = new StreamController<Point>();
  Stream<Point> get onAction => _onAction.stream;

  Rectangle get polygon =>
      new Rectangle(
          offset.x,
          offset.y,
          icon.width + (padding * 2),
          icon.height + (padding * 2));

  void set polygon(Rectangle rect) {
    offset = new Point(rect.left, rect.top);
  }

  int padding = 2;

  setIcon({
    String name,
    String extension: "png",
    String path: "/resources/icons"}) {

    icon.id = name;
    icon.src = "${path}/${name}.${extension}";
  }

  render(CanvasRenderingContext2D context) {

    if (isHover) {
      Rectangle rect = polygon;
      context..fillStyle =
                  "rgb(${backgroundColor.map((i){return i+15;}).join(", ")})"
             ..fillRect(rect.left, rect.top, rect.width, rect.height);
    }

    context.drawImage(icon, polygon.left + padding, polygon.top + padding);
  }

  bool triggerClick(MouseEvent event) {
    _onAction.add(event.offset);
    return false;
  }

}