part of FrameUI;

class IconButton extends ControlStructureElement {

  final ImageElement icon = new ImageElement();

  IconButton({String iconName}) {
    icon.onLoad.listen(_onLoad);
  }

  IconButton.fromIcon({
    String name,
    String path: "/resources/icons",
    String extension: "png"}) {

    icon.src = "${path}/${name}.${extension}";
    icon.id = name;
    icon.onLoad.listen(_onLoad);
  }

  _onLoad(Event event) {
    size = new Point(icon.width, icon.height);
  }

  render(CanvasRenderingContext2D context) {

    context.drawImage(icon, area.left, area.top);

  }

}