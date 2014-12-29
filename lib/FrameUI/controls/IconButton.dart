part of FrameUI;

class IconButton implements IControlStructureElement {

  final ImageElement icon = new ImageElement();

  Point position = new Point(0, 0);

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
    Function action,
    String path: "/resources/icons",
    String extension: "png"}) {

    icon.src = "${path}/${name}.${extension}";
    icon.id = name;

    _onAction = action;
  }

  render(CanvasRenderingContext2D context) {
    context.drawImage(icon, area.left + padding, area.top + padding);
  }

  action(Point point) {
    _onAction();
  }

}