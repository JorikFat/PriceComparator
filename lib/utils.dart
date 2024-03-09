extension ListExt<T> on List<T> {
  List<R> convert<R>(R Function(T) converter) => map(converter).toList();
}
