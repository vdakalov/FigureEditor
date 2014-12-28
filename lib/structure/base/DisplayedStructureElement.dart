part of FrameUI;

class DisplayedStructureElement
extends SimpleStructureElement
implements IRenderingElement {

  @override
  render(CanvasRenderingContext2D context) {
    _children.forEach((child){
      if (child is DisplayedStructureElement) {
        child.render(context);
      }
    });
  }
}