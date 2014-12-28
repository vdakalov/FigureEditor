part of FrameUI;

class ControlStructureElement
extends DisplayedStructureElement
implements IControlStructureElement {

  PanelStructureElement parent;
  List<ControlStructureElement> _children = new List<ControlStructureElement>();

}