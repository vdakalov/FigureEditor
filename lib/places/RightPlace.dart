part of FrameUI;

class RightPlace extends Place {

  update() {

    int width = 0, height = 0;

    _children.forEach((panel){
      width = panel.polygon.width > width ? panel.polygon.width : width;
      height = panel.polygon.height > height ? panel.polygon.height : height;
    });

    polygon = new Rectangle(
        polygon.width - width,
        polygon.top,
        width,
        polygon.height);

  }

}