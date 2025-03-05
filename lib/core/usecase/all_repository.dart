abstract class AllRepository<T> {
  final Map<String, T> _items = {};
  Map<String, T> get getItems => _items;

  addAll(Map<String, T> other) {
    _items.addAll(other);
  }

  updated(String id, T value) {
    T? temp = _items[id];
    if (temp != null) {
      _items[id] = value;
    }
  }

  clearAll() {
    _items.clear();
  }

  getById(String id) {
    return _items[id];
  }

  remove(String id) {
    _items.remove(id);
  }
}
