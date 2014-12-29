part of FrameUI;

class ListItems implements IControlStructureElement {

  List<ListItem> _items = new List<ListItem>();
  ListItem current;

  bool visible = true;
  bool isHover = false;
  bool isActive = false;
  String cursor = "";

  StreamController<ListItem> _onSelect = new StreamController<ListItem>();
  Stream<ListItem> get onSelect => _onSelect.stream;

  Rectangle area = new Rectangle(0, 0, 0, 0);

  addItem(ListItem item, {bool isCurrent: true}) {
    item.parent = this;
    _items.add(item);

    if (isCurrent) {
      select(item);
    }
  }

  removeItem(ListItem item) {
    if (_items.contains(item)) {

      int index = _items.indexOf(item);

      if (current == item) {
        current = null;
      }

      _items.remove(item);

      if (_items.length > 0) {
        index = _items.length - 1 > index ? index : _items.length - 1;
        select(_items.elementAt(index));
      } else {
        _onSelect.add(null);
      }
    }
  }

  removeItemById(int id) {
    for (Iterator iter = _items.iterator; iter.moveNext();) {
      if (iter.current.id == id) {
        removeItem(iter.current);
        break;
      }
    }
  }

  render(CanvasRenderingContext2D context) {

    int padding = 10;
    int offset = 0;

    _items.forEach((item){
      item.area = new Rectangle(
          area.left + padding,
          area.top + padding + offset,
          area.width - (padding * 2),
          item.size + (item.padding * 2));

      offset += item.area.height;
      item.render(context);
    });

  }

  selectById(int id) {
    _items.forEach((item){
      if (item.id == id) {
        select(item);
      }
    });
  }

  select(ListItem item) {
    if (_items.contains(item) && current != item) {
      current = item;
      _onSelect.add(item);
    }
  }

  action(Point point) {
    _items.forEach((item){
      if (item.area.containsPoint(point)) {
        select(item);
      }
    });
  }

  mouseMove(Point point) {

  }

  mouseDown(Point point) {

  }

  mouseUp(Point point) {

  }

}