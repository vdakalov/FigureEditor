part of FrameUI;

class LeftPlace extends VericalPlace {

  Point get position =>
      parent is FrameStructureElement ?
          new Point(
              parent.size.x - size.x,
              parent.top is TopPlace ? parent.top.size.y : 0) :
          new Point(0, 0);

  Point get size =>
      // TODO Implements
      new Point(0, 0);
}