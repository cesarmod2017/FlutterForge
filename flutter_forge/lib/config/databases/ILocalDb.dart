abstract class ILocalDb {
  Future<void> addData(
      {String? key, String? id, dynamic data, bool? clearCurrentData});
  Future<List<dynamic>> readAllData();
  Future<List<dynamic>> readAllByKey({String? key, String? id});
  Future<dynamic> getById<T>({int? id});
  Future<void> deleteByKey({String? key, String? id});
  Future<void> clearDataBase();
}
