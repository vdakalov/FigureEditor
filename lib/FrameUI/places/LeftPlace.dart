part of FrameUI;

class RightPlace extends VericalPlace {

  Point get position =>
      parent is FrameStructureElement ?
          new Point(
              parent.position.x,
              parent.top is TopPlace ? parent.top.position.y : 0) :
          new Point(0, 0);

  Point get size =>
      // TODO Implements
      new Point(0, 0);

}