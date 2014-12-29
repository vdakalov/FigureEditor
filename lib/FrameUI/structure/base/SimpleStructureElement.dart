part of FrameUI;

class SimpleStructureElement implements IStructureElement {

  @override
  SimpleStructureElement parent;

  @override
  List<SimpleStructureElement> _children;

  List<int> backgroundColor = [220, 220, 220];

  Point position;
  Point size;

  Point getSize() {
    Point result = new Point(0, 0);
    _children.forEach((child){
      result += child.size;
    });
    return result;
  }

  add(SimpleStructureElement child) {
    child.parent = this;
    _children.add(child);
  }

  render(CanvasRenderingContext2D context) {

    Point pos = position;
    Point sizes = size;

    context
           // render background
           ..beginPath()
           ..fillStyle = "rgb(${backgroundColor.join(", ")})"
           ..fillRect(pos.x, pos.y, sizes.x, sizes.y)
           ..fill()
           ..closePath();

    _children.forEach((child){
      child.render(context);
    });
  }

}