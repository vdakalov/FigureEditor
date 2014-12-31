
import "dart:html";
import "dart:async";
import "package:FigureEditor/FigureEditor.dart";

main() {

  CanvasElement canvas = new CanvasElement(width: 500, height: 450);
  CanvasRenderingContext2D context = canvas.getContext("2d");
  document.body.append(canvas);
  canvas.tabIndex = 1;
  canvas.focus();

  DivElement fpsLabel = new DivElement();
  document.body.append(fpsLabel);

  FigureEditor fe = new FigureEditor.fromCanvas(canvas);

  new Timer(new Duration(seconds: 5), (){
    canvas..width = 1000
          ..height = 600;

    fe.frame.update();
  });

}