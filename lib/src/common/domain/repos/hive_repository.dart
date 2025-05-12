abstract class HiveRepository<T> {

//Get All Data
Future<T?> getAll();

Future<void> insertItem({required T object});

Future<bool> isDataAvailable();

}
