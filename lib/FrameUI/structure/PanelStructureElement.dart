part of FrameUI;

class PanelStructureElement {

  List<IControlStructureElement> elements =
      new List<IControlStructureElement>();

  List<int> backgroundColor = [255, 220, 220];
  Rectangle area = new Rectangle(0, 0, 0, 0);

  render(CanvasRenderingContext2D context) {

    context..fillStyle = "rgb(${backgroundColor.join(", ")})"
           ..fillRect(area.left, area.top, area.width, area.height);

    int offset = 0;

    elements.forEach((child){

      child.area = new Rectangle(
          area.left + offset,
          area.top,
          child.area.width,
          child.area.height);

      offset += child.area.width;
      child.render(context);
    });
  }

}