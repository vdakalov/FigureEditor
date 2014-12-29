part of FrameUI;

class ControlStructureElement
extends SimpleStructureElement
implements IControlStructureElement {

  PanelStructureElement parent;
  List<ControlStructureElement> _children = new List<ControlStructureElement>();

}