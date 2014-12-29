part of FrameUI;

abstract class IStructureElement {

  IStructureElement parent;
  List<IStructureElement> _children;
  Point position;
  Point size;

  void add(IStructureElement child);

}