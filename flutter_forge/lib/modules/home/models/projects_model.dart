import 'package:flutter/material.dart';
import 'package:flutter_forge/config/databases/database_models.dart';
import 'package:flutter_forge/config/databases/sql_lite_base.dart';
import 'package:flutter_forge/packages/nexacode_packages.dart';

class ProjectsModel extends SqfLiteBase<ProjectsModel> {
  String? id;
  String? name;
  String? pathProject;
  String? androidFile;
  String? androidConfig;
  String? iosFile;
  String? iosConfig;

//properties control
  TextEditingController? projectNameController;
  TextEditingController? projectPathController;
  TextEditingController? androidFileController;
  CodeController? androidConfigController;
  TextEditingController? iosFileController;
  CodeController? iosConfigController;

  ProjectsModel({
    this.id,
    this.name,
    this.pathProject,
    this.androidFile,
    this.androidConfig,
    this.iosFile,
    this.iosConfig,
    this.projectNameController,
    this.projectPathController,
    this.androidFileController,
    this.androidConfigController,
    this.iosFileController,
    this.iosConfigController,
  }) : super(DatabaseModels.projectsModel);

  ProjectsModel.fromJson(Map<String, dynamic> json)
      : super(DatabaseModels.projectsModel) {
    id = json['id'];
    name = json['name'];
    pathProject = json['pathProject'];
    androidFile = json['androidFile'];
    androidConfig = json['androidConfig'];
    iosFile = json['iosFile'];
    iosConfig = json['iosConfig'];
    projectNameController = TextEditingController(text: name);
    projectPathController = TextEditingController(text: pathProject);
    androidFileController = TextEditingController(text: androidFile);
    androidConfigController = CodeController(text: androidConfig);
    iosFileController = TextEditingController(text: iosFile);
    iosConfigController = CodeController(text: iosConfig);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['pathProject'] = pathProject;
    data['androidFile'] = androidFile;
    data['androidConfig'] = androidConfig;
    data['iosFile'] = iosFile;
    data['iosConfig'] = iosConfig;

    return data;
  }

  Future<ProjectsModel> getFirst() async {
    var list = await getAll<ProjectsModel>(ProjectsModel.fromJson);
    return list.first;
  }

  Future<List<ProjectsModel>> getList() async {
    var list = await getAll<ProjectsModel>(ProjectsModel.fromJson);
    list.sort((a, b) => b.name!.compareTo(a.name!));
    return list;
  }
}
