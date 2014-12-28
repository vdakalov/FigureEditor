part of FrameUI;

abstract class IStructureElement {

  IStructureElement parent;
  List<IStructureElement> _children;
  Rectangle area;

  void add(IStructureElement child);
  void updateSize();
  void updatePosition();

}