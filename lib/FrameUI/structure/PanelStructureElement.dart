part of FrameUI;

class PanelStructureElement {

  List<IControlStructureElement> elements =
      new List<IControlStructureElement>();

  List<int> backgroundColor = [230, 230, 230];
  Rectangle area = new Rectangle(0, 0, 0, 0);

  int padding = 2;

  render(CanvasRenderingContext2D context) {

    context..beginPath()
           ..fillStyle = "rgb(${backgroundColor.join(", ")})"
           ..fillRect(area.left, area.top, area.width, area.height)
           ..fill()
           ..closePath()

           ..beginPath()
           ..strokeStyle =
            "rgb(${backgroundColor.map((i){return i+25;}).join(", ")})"
           ..moveTo(area.left+1, area.bottom-1)
           ..lineTo(area.left+1, area.top+1)
           ..lineTo(area.right-1, area.top+1)
           ..stroke()
           ..closePath()

           ..beginPath()
           ..strokeStyle =
              "rgb(${backgroundColor.map((i){return i-35;}).join(", ")})"
           ..moveTo(area.right-1, area.top+1)
           ..lineTo(area.right-1, area.bottom-1)
           ..lineTo(area.left+1, area.bottom-1)
           ..stroke()
           ..closePath()
           ;

    int offset = 0;

    elements
    .where((element){ return element.visible; })
    .forEach((child){
      child.area = new Rectangle(
          area.left + padding + offset,
          area.top + padding,
          child.area.width,
          child.area.height);

      offset += child.area.width;
      child.render(context);
    });
  }

}