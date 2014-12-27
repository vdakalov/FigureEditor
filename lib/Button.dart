part of FrameUI;

class Button extends RenderingElement {

  Button(width, height): super(width: width, height: height);
  Button.fromContext(context): super.fromContext(context);

  Rectangle get polygon =>
      icon is ImageElement ?
        new Rectangle(
            area is Rectangle ? area.left : 0,
            area is Rectangle ? area.top : 0,
            icon.width,
            icon.height) :

        new Rectangle(
            area is Rectangle ? area.left : 0,
            area is Rectangle ? area.top : 0,
            0, 0);

  ImageElement icon;

  String get iconName => iconName;
  void set iconName(String name) {
    icon = new ImageElement(src: "/resources/icons/${name}.png");
  }

  render() {

    if (icon is ImageElement) {
      context.drawImage(icon, polygon.left, polygon.top);
    }

  }

  action(Point point) {

  }


}