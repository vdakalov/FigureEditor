part of FigureEditor;

class Model {

  final List<Point> points = new List<Point>();
  int _id;
  int get id => _id;

  Model(int id) {
    _id = id;
  }

}