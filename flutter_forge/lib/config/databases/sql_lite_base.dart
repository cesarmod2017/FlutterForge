import 'dart:convert';

import 'package:flutter_forge/app_constants.dart';

abstract class SqfLiteBase<T> {
  late String keyModel;
  SqfLiteBase(this.keyModel);

  Future<void> save({bool? clearCurrentData, String? id}) async {
    await dbContext.addData(
        key: keyModel,
        data: this,
        id: id,
        clearCurrentData: clearCurrentData ?? false);
  }

  Future<void> update({String? id}) async {
    await dbContext.addData(
        key: keyModel, data: this, id: id, clearCurrentData: true);
  }

  Future<void> saveByKey(
      {required String key, String? id, bool? clearCurrentData}) async {
    await dbContext.addData(
        key: key, id: id, data: this, clearCurrentData: clearCurrentData);
  }

  Future<void> delete({String? id}) async {
    await dbContext.deleteByKey(
      key: keyModel,
      id: id,
    );
  }

  Future<T?> get(T Function(Map<String, dynamic>) fromJson) async {
    var list = await getAll<T>(fromJson);
    return list.first;
  }

  // ignore: avoid_shadowing_type_parameters
  Future<List<T>> getAll<T>(T Function(Map<String, dynamic>) fromJson,
      {String? id, String? key}) async {
    var resultList = await dbContext.readAllByKey(
      key: key ?? keyModel,
      id: id,
    );
    return resultList
        .map((e) {
          final decodedData = jsonDecode(e['VALUE']);
          if (decodedData is List) {
            return decodedData
                .map((item) => fromJson(item[0] as Map<String, dynamic>))
                .toList() as T;
          }
          return fromJson(decodedData as Map<String, dynamic>);
        })
        .where((e) => e != null)
        .cast<T>()
        .toList();
  }

  Future<List<T>> getAllByKey<T>(
      String key, String? id, T Function(Map<String, dynamic>) fromJson) async {
    var resultList = await dbContext.readAllByKey(
      key: key,
      id: id,
    );
    return resultList
        .map((e) {
          final decodedData = jsonDecode(e['VALUE']);
          if (decodedData is List) {
            return decodedData
                .map((item) => fromJson(item[0] as Map<String, dynamic>))
                .toList() as T;
          }
          return fromJson(decodedData as Map<String, dynamic>);
        })
        .where((e) => e != null)
        .cast<T>()
        .toList();
  }
  // Mais métodos podem ser adicionados aqui, como delete, getByWhere, etc.
}
