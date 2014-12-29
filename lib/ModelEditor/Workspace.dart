part of ModelEditor;

class Workspace implements WM.IControlStructureElement {

  final int MODE_CREATE = 0;
  final int MODE_MOVE = 1;

  Model model;
  int currentPointIndex;

  bool visible = true;
  bool isHover = false;
  bool isActive = false;
  String cursor = "crosshair";

  int _mode;
  int get mode => _mode;

  Rectangle area = new Rectangle(0, 0, 0, 0);

  Workspace() {
    _mode = MODE_CREATE;
  }

  render(CanvasRenderingContext2D context) {

    if (model is Model) {

      if (model.points.length > 1) {
        context..moveTo(model.points.first.x, model.points.first.y)
               ..strokeStyle = "rgb(0, 0, 0)"
               ..beginPath();

        model.points.forEach((point){
          context.lineTo(point.x, point.y);
        });

        if (model.points.length > 2) {
          context.lineTo(model.points.first.x, model.points.first.y);
        }
        context.stroke();
        context.closePath();
      }

      model.points.forEach((point){
        context..beginPath()
               ..fillStyle = "rgb(0, 0, 0)"
               ..fillRect(point.x-1, point.y-1, 3, 3)
               ..closePath();
      });
    }
  }

  action(Point point) {
    if (model is Model && _mode == MODE_CREATE) {
      model.points.add(point);
    }
  }

  mouseMove(Point point) {
    if (model is Model) {
      if (_mode == MODE_MOVE && currentPointIndex is int) {
        model.points[currentPointIndex] = point;
      }
    }
  }

  mouseDown(Point point) {
    if (model is Model && _mode == MODE_MOVE) {
      Rectangle rect = new Rectangle(point.x-2, point.y-2, 5, 5);
      Iterable points = model.points.where((vertex){
        return rect.containsPoint(vertex);
      });
      if (points.length > 0) {
        currentPointIndex = model.points.indexOf(points.first);
      }
    }
  }

  mouseUp(Point point) {

    if (model is Model) {

      if (_mode == MODE_MOVE && currentPointIndex is int) {
        currentPointIndex = null;
      }
    }
  }

  toggleMode() {
    List<int> modes = [MODE_CREATE, MODE_MOVE];
    _mode = modes[(modes.indexOf(_mode) + 1) % modes.length];
  }

}