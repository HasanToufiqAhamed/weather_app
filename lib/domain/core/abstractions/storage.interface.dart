abstract class IStorage<T> {
  Future<void> write({required String key, required dynamic value});

  T? read<T>(String key);

  Future<void> writeObject<T>({
    required String key,
    required T value,
    required Map<String, dynamic> Function(T v)? encoder,
  });

  Future<void> delete(String key);

  T? readObject<T>(String key, {T Function(String v)? decoder});

  List<T> allList<T>({T Function(String v)? decoder});
}
