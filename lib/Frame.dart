part of FrameUI;

const int FRAMEUI_PLACEMENT_VERTICAL = 0x200;
const int FRAMEUI_PLACEMENT_HORIZONTAL = 0x201;
const int FRAMEUI_POSITION_TOP = 0x202;
const int FRAMEUI_POSITION_LEFT = 0x203;
const int FRAMEUI_POSITION_RIGHT = 0x204;
const int FRAMEUI_POSITION_BOTTOM = 0x205;
const int FRAMEUI_POSITION_CUSTON = 0x206;

class Frame extends SimpleRenderingElement {

  TopPlace top = new TopPlace();
  LeftPlace left = new LeftPlace();
  RightPlace right = new RightPlace();
  BottomPlace bottom = new BottomPlace();
  CenterPlace center = new CenterPlace();

  init() {
    parent.onPolygonChange.listen(updatePlaces);
  }

  updatePlaces(Rectangle _) {

    polygon = parent.polygon;

    top.polygon = new Rectangle(
        polygon.left,
        polygon.top,
        polygon.width,
        top.polygon.height);

    bottom.polygon = new Rectangle(
        polygon.left,
        polygon.bottom - bottom.polygon.height,
        polygon.width,
        bottom.polygon.height);

    left.polygon = new Rectangle(
        0,
        top.polygon.bottom,
        left.polygon.width,
        parent.polygon.height - (top.polygon.height + bottom.polygon.height));

    right.polygon = new Rectangle(
        parent.polygon.right - right.polygon.width,
        top.polygon.bottom,
        right.polygon.width,
        parent.polygon.height - (top.polygon.height + bottom.polygon.height));

    center.polygon = new Rectangle(
        left.polygon.right,
        top.polygon.bottom,
        right.polygon.left - left.polygon.right,
        parent.polygon.height - (top.polygon.height + bottom.polygon.height));

  }

  render(CanvasRenderingContext2D context) {

    center.render(context);
    left.render(context);
    right.render(context);
    top.render(context);
    bottom.render(context);

  }

}