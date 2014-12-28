part of FrameUI;

class LeftPlace extends Place {

  update() {

    int width = 0, height = 0;

    _children.forEach((panel){
      width = panel.polygon.width > width ? panel.polygon.width : width;
      height = panel.polygon.height > height ? panel.polygon.height : height;
    });

    polygon = new Rectangle(polygon.left, polygon.top, width, polygon.height);

  }

}