part of FrameUI;

class TopPlace extends HorizontalPlace {

  Point get position =>
      parent is FrameStructureElement ? parent.position : new Point(0, 0);

  Point get size =>
      parent is FrameStructureElement ? new Point(parent.size.x, 0) :
        new Point(0, 0);

}