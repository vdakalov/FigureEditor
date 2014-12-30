
import "dart:html";
import "package:FigureEditor/FigureEditor.dart";

main() {

  CanvasElement canvas = new CanvasElement(width: 1000, height: 600);
  CanvasRenderingContext2D context = canvas.getContext("2d");
  document.body.append(canvas);
  canvas.tabIndex = 1;
  canvas.focus();

  FigureEditor fe = new FigureEditor.fromCanvas(canvas);

}