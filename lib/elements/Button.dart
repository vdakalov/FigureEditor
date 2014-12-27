part of FrameUI;

class Button extends SimpleRenderingElement implements IconElement {

  List<Element> _children = new List<Element>();

  ImageElement icon = new ImageElement();
  Point offset = new Point(0, 0);

  StreamController<Point> _onAction = new StreamController<Point>();
  Stream<Point> get onAction => _onAction.stream;

  Rectangle get polygon =>
      new Rectangle(offset.x, offset.y, icon.width, icon.height);

  void set polygon(Rectangle rect) {
    offset = new Point(rect.left, rect.top);
  }

  setIcon({
    String name,
    String extension: "png",
    String path: "/resources/icons"}) {

    icon.id = name;
    icon.src = "${path}/${name}.${extension}";
  }

  render(CanvasRenderingContext2D context) {
    context.drawImage(icon, polygon.left, polygon.top);
  }

  bool triggerClick(MouseEvent event) {
    _onAction.add(event.offset);
    return false;
  }

}