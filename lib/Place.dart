part of FrameUI;

class Place extends SimpleRenderingElement {

  Frame parent;
  List<Panel> _children = new List<Panel>();
  List<int> backgroundColor = [225, 225, 225];

  add(Panel panel) {
    panel.parent = this;
    _children.add(panel);
    updateSizes();
  }

  render(CanvasRenderingContext2D context) {

    super.render(context);

    _children.forEach((panel){
      panel.render(context);
    });
  }

}