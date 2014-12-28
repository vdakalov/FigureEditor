part of FrameUI;

class BottomPlace extends Place {

  update() {

    int width = 0, height = 0;

    _children.forEach((panel){
      width = panel.polygon.width > width ? panel.polygon.width : width;
      height = panel.polygon.height > height ? panel.polygon.height : height;
    });

    polygon = new Rectangle(
        polygon.left,
        parent.polygon.height - height,
        polygon.width,
        height);

  }

}