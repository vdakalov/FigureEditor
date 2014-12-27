part of FrameUI;

const int FRAMEUI_PLACEMENT_VERTICAL = 0x200;
const int FRAMEUI_PLACEMENT_HORIZONTAL = 0x201;
const int FRAMEUI_POSITION_TOP = 0x202;
const int FRAMEUI_POSITION_LEFT = 0x203;
const int FRAMEUI_POSITION_RIGHT = 0x204;
const int FRAMEUI_POSITION_BOTTOM = 0x205;

class Place extends RenderingElement {

  Place(width, height): super(width: width, height: height);
  Place.fromContext(context): super.fromContext(context);

  List<Panel> _panels = new List<Panel>();
  List<int> color = new List<int>(3);

  int placement;
  int position;


  init() {

  }

  add(Panel panel) {
    _panels.add(panel);
    panel.placement = placement;
    panel.onPolygonUpdate.listen(_updateRectangle);
    _updateRectangle(polygon);
  }

  _updateRectangle(Rectangle _) {
    int width = 0, height = 0;
    _panels.forEach((panel){
      width = panel.polygon.width > width ? panel.polygon.width : width;
      height = panel.polygon.height > height ? panel.polygon.height : height;
    });

    if (placement == FRAMEUI_PLACEMENT_HORIZONTAL) {
      polygon = new Rectangle(polygon.left, polygon.top, polygon.width, height);
    } else if (placement == FRAMEUI_PLACEMENT_VERTICAL) {
      polygon = new Rectangle(polygon.left, polygon.top, width, polygon.height);
    }

  }

  render() {

    context..fillStyle = "rgb(${color[0]}, ${color[1]}, ${color[2]})"
           ..fillRect(polygon.left, polygon.top, polygon.width, polygon.height);

    _panels.forEach((panel){
      panel.render();
    });

  }

}