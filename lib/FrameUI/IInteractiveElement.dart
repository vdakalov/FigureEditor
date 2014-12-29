part of FrameUI;

abstract class IInteractiveElement {

  bool isHover;

  void onClick(MouseEvent event);
  void onMouseMove(MouseEvent event);
  void onMouseUp(MouseEvent event);
  void onMouseDown(MouseEvent event);
  void onMouseEnter(MouseEvent event);
  void onMouseOut(MouseEvent event);

  void onKeyPress(KeyboardEvent event);
  void onKeyDown(KeyboardEvent event);
  void onKeyUp(KeyboardEvent event);

  bool triggerClick(MouseEvent event);
  bool triggerMouseMove(MouseEvent event);
  bool triggerMouseUp(MouseEvent event);
  bool triggerMouseDown(MouseEvent event);
  bool triggerMouseEnter(MouseEvent event);
  bool triggerMouseOut(MouseEvent event);
  bool triggerMouseOver(MouseEvent event);

  bool triggerKeyPress(KeyboardEvent event);
  bool triggerKeyDown(KeyboardEvent event);
  bool triggerKeyUp(KeyboardEvent event);

}