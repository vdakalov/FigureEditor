part of FrameUI;

class PlaceStructureElement extends SimpleStructureElement {

  FrameStructureElement parent;
  List<PanelStructureElement> _children = new List<PanelStructureElement>();

  List<int> backgroundColor = [220, 220, 255];

}