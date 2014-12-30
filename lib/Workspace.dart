part of FigureEditor;

class Workspace extends FrameUI.Rendering {

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

  singleCalc() {
    if (parent is FrameUI.Rendering) {
      area = new Rectangle(0, 0, parent.area.width, parent.area.height);
    }

    super.singleCalc();
  }

  render(CanvasRenderingContext2D context) {

    style.cursor = FrameUI.CURSOR.DEFAULT;

    if (model is Model) {
      style.cursor = _mode == MODE_MOVE ?
          FrameUI.CURSOR.MOVE : FrameUI.CURSOR.CROSSHAIR;

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

  onAction(Point point, MouseEvent event) {
    if (model is Model && _mode == MODE_CREATE) {
      model.points.add(point);
    }
  }

  onMouseMove(Point point, MouseEvent event) {
    if (model is Model) {
      if (_mode == MODE_MOVE && currentPointIndex is int) {
        model.points[currentPointIndex] = point;
      }
    }
  }

  onMouseDown(Point point, MouseEvent event) {
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

  onMouseUp(Point point, MouseEvent event) {
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

  createMode() {
    _mode = MODE_CREATE;
  }

  moveMode() {
    _mode = MODE_MOVE;
  }

}