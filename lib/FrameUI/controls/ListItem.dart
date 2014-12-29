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

  bool visible = true;
  bool isHover = false;
  bool isActive = false;

  ListItem(this.id, this.title);

  render(CanvasRenderingContext2D context) {

    if (isSelected) {
      context..beginPath()
             ..fillStyle = "rgb(210, 210, 210)"
             ..fillRect(area.left, area.top, area.width, area.height)
             ..closePath();
    }

    context..beginPath()
           ..fillStyle = "rgb(${color.join(", ")})"
           ..font = "${size}px Verdana"
           ..textBaseline = "middle"
           ..fillText(
               title,
               area.left + padding,
               area.top + (area.height / 2),
               area.width - (padding * 2))
           ..closePath()
           ;
  }

  action(Point point) {

  }

  mouseMove(Point point) {

  }

  mouseDown(Point point) {

  }

  mouseUp(Point point) {

  }

}