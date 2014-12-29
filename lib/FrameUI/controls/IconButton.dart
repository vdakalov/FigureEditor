part of FrameUI;

class IconButton implements IControlStructureElement {

  final ImageElement icon = new ImageElement();

  Point position = new Point(0, 0);

  bool isHover = false;
  bool isActive = false;
  bool visible = true;

  Rectangle get area => new Rectangle(
      position.x,
      position.y,
      icon.width + (padding * 2),
      icon.height + (padding * 2));

  void set area(Rectangle rect) {
    position = new Point(rect.left, rect.top);
  }

  int padding = 4;

  List<int> backgroundColor = [220, 255, 220];

  Function _onAction;

  IconButton({
    String name,
    Function action: null,
    bool visible: true,
    String path: "/resources/icons",
    String extension: "png"}) {

    setIcon(name: name, path: path, extension: extension);
    icon.id = name;

    _onAction = action;
  }

  setIcon({
    String name,
    Function action: null,
    bool visible: true,
    String path: "/resources/icons",
    String extension: "png"}) {

    icon.src = "${path}/${name}.${extension}";
  }

  render(CanvasRenderingContext2D context) {

    if (isHover) {
      context..fillStyle = "rgb(${backgroundColor.join(", ")})"
             ..fillRect(area.left, area.top, area.width, area.height);
    }

    context.drawImage(icon, area.left + padding, area.top + padding);
  }

  action(Point point) {
    if (_onAction is Function) {
      _onAction();
    }
  }

  mouseMove(Point point) {

  }

  mouseDown(Point point) {

  }

  mouseUp(Point point) {

  }

}