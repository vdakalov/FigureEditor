part of FrameUI;

class RenderingElement {

  FrameUI frame;
  CanvasRenderingContext2D context;
  Rectangle polygon;

  Map<String, StreamSubscription> _subscriptions =
      new Map<String, StreamSubscription>();

  RenderingElement({int width: null, int height: null}) {

    width = width is int ? width : width = document.body.clientWidth - 3;
    height = height is int ? height : document.body.clientHeight - 3;

    CanvasElement canvas = new CanvasElement(width: width, height: height);

    context = canvas.getContext("2d");

    _init();
  }

  RenderingElement.fromContext(this.context) {
    _init();
  }

  _init() {

    polygon = new Rectangle(0, 0, context.canvas.width, context.canvas.height);

    _subscriptions["resize"] = context.canvas.onResize.listen(_onResize);
    _subscriptions["click"] = context.canvas.onClick.listen(_onClick);

    init();
  }

  destroy() {

    // unsubscribed
    _subscriptions.forEach((name, substribe){
      substribe.cancel();
    });

  }

  init() {}

  render(dynamic some) {}

  onResize(Event event) {}
  _onResize(Event event) {
    onResize(event);
  }

  onClick(MouseEvent event) {}
  _onClick(MouseEvent event) {
    if (polygon.containsPoint(event.offset)) {
      onClick(event);
    }
  }

}