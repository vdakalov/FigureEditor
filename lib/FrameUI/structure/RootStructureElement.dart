part of FrameUI;

class RootStructureElement extends SimpleStructureElement {

  CanvasRenderingContext2D context;

  List<FrameStructureElement> _children = new List<FrameStructureElement>();

  Point get position =>
      new Point(0, 0);

  Point get size =>
      new Point(context.canvas.width, context.canvas.height);

  List<int> backgroundColor = [180, 180, 180];

  add(FrameStructureElement frame) {
    frame.parent = this;
    _children.add(frame);
  }

}