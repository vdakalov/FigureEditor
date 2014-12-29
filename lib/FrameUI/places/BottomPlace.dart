part of FrameUI;

class BottomPlace extends HorizontalPlace {

  Point get position =>
      parent is FrameStructureElement ?
          new Point(parent.size.y - size.y, parent.position.x) :
          new Point(0, 0);

  Point get size =>
      // TODO Implements
      new Point(0, 0);

}