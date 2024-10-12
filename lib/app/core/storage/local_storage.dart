abstract interface class LocalStorage {
  Future<void> init();
  P? read<P>(String key);
  bool contains(String key);
  Future<void> write<P>(String key, P value);
  Future<void> clear();
  Future<void> remove(String key);
}
