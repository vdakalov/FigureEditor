part of FrameUI;

class ListItem implements IControlStructureElement {

  ListItems parent;
  bool get isSelected => parent.current == this;

  int id;
  String title;

  Rectangle area = new Rectangle(0, 0, 0, 0);
  List<int> color = [30, 30, 30];
  int size = 16;
  int padding = 2;

  ListItem(this.id, this.title);

  render(CanvasRenderingContext2D context) {

    if (isSelected) {
      context..fillStyle = "rgb(210, 210, 210)"
             ..fillRect(area.left, area.top, area.width, area.height);
    }

    context..fillStyle = "rgb(${color.join(", ")})"
           ..font = "${size}px Verdana"
           ..textBaseline = "middle"
           ..fillText(
               title,
               area.left + padding,
               area.top + (area.height / 2),
               area.width - (padding * 2));
  }

  action(Point point) {

  }

}