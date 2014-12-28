part of FrameUI;

class DisplayedStructureElement
extends SimpleStructureElement
implements IRenderingElement {

  List<int> backgroundColor = [220, 220, 220, 1];

  @override
  render(CanvasRenderingContext2D context) {

    context
          // render background
          ..beginPath()
          ..fillStyle = "rgba(${backgroundColor.join(", ")})"
          ..fillRect(area.left, area.top, area.width, area.height)
          ..fill()
          ..closePath();

    super.render(context);
  }



}