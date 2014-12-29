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

  List<int> backgroundColor = [240, 240, 240];

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
             ..fillRect(
                 area.left + 2,
                 area.top + 2,
                 area.width - 4,
                 area.height - 4);
    }

    context..beginPath()
           ..strokeStyle =
              "rgb(${backgroundColor.map((i){return i+25;}).join(", ")})"
           ..moveTo(area.left+1, area.bottom-1)
           ..lineTo(area.left+1, area.top+1)
           ..lineTo(area.right-1, area.top+1)
           ..stroke()
           ..closePath()

           ..beginPath()
           ..strokeStyle =
              "rgb(${backgroundColor.map((i){return i-35;}).join(", ")})"
           ..moveTo(area.right-1, area.top+1)
           ..lineTo(area.right-1, area.bottom-1)
           ..lineTo(area.left+1, area.bottom-1)
           ..stroke()
           ..closePath();

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