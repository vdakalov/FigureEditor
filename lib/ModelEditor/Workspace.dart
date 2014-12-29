part of ModelEditor;

class Workspace implements WM.IControlStructureElement {

  Model model;

  bool visible = true;
  bool isHover = false;

  Rectangle area = new Rectangle(0, 0, 0, 0);

  render(CanvasRenderingContext2D context) {

    if (model is Model) {

      model.points.forEach((point){
        context..beginPath()
               ..fillStyle = "rgb(255,0,0)"
               ..fillRect(point.x-1, point.y-1, 3, 3)
               ..closePath();
      });

    }

  }

  action(Point point) {
    if (model is Model) {
      model.points.add(point);
    }
  }

  move(Point point) {

  }

}