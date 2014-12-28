part of FrameUI;

class RootRenderingElement extends SimpleStructureElement {

  List<Frame> _children = new List<Frame>();

  render(CanvasRenderingContext2D context) {
    _children.forEach((frame){
      frame.render(context);
    });
  }
}