import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_forge/exports/basic_exports.dart';
import 'package:flutter_forge/exports/get_exports.dart';
import 'package:flutter_forge/modules/home/models/command_message.dart';
import 'package:flutter_forge/modules/home/models/projects_model.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

class HomeController extends GetxController {
  HomeController();

  ScrollController scrollController = ScrollController();
  List<ProjectsModel> projectsList = [];
  ProjectsModel? selectedProject;
  List<CommandMessageModel> messages = [];

  bool? configType;
  @override
  Future<void> onReady() async {
    // await dbContext.deleteByKey(key: DatabaseModels.projectsModel);
    await loadProjects();
    super.onReady();
  }

  Future<void> addProject() async {
    final project =
        ProjectsModel(name: 'new_project'.tr, id: const Uuid().v4());
    await project.save(id: project.id!);
    await loadProjects();
  }

  Future<void> loadProjects() async {
    projectsList = [];
    final list = await ProjectsModel().getList();
    if (list.isNotEmpty) {
      projectsList = list;
      update();
    }
  }

  void selectProject(ProjectsModel project) {
    selectedProject = project;
    if (selectedProject != null) {
      selectedProject!.projectNameController!.text = project.name!;
    }
    update();
  }

  Future<void> changeProjectName(String value) async {
    if (selectedProject != null) {
      selectedProject!.name = value;
      await selectedProject!.update(id: selectedProject!.id!);
      await loadProjects();
    }
  }

  Future<void> changeProjectPath(String value) async {
    if (selectedProject != null) {
      selectedProject!.pathProject = value;
      await selectedProject!.update(id: selectedProject!.id!);
      await loadProjects();
    }
  }

  Future<void> changeAndroidFile(String value) async {
    if (selectedProject != null) {
      selectedProject!.androidFile = value;
      await selectedProject!.update(id: selectedProject!.id!);
      await loadProjects();
    }
  }

  Future<void> changeIosFile(String value) async {
    if (selectedProject != null) {
      selectedProject!.iosFile = value;
      await selectedProject!.update(id: selectedProject!.id!);
      await loadProjects();
    }
  }

  Future<void> changeAndroidConfig(String value) async {
    if (selectedProject != null) {
      selectedProject!.androidConfig = value;
      await selectedProject!.update(id: selectedProject!.id!);
      await loadProjects();
    }
  }

  Future<void> changeIosConfig(String value) async {
    if (selectedProject != null) {
      selectedProject!.iosConfig = value;
      await selectedProject!.update(id: selectedProject!.id!);
      await loadProjects();
    }
  }

  void setConfigType(bool? value) {
    configType = value;
    update();
  }

  Future<void> createFileAndFolder(String filePath, String content) async {
    try {
      final directory = p.dirname(filePath);

      // Deleta o diretório se ele existir
      if (!await Directory(directory).exists()) {
        await Directory(directory).create(recursive: true);
      }

      // Deleta o arquivo se ele existir
      if (await File(filePath).exists()) {
        await File(filePath).delete();
      }
      // Cria o arquivo e escreve o conteúdo nele
      await File(filePath).writeAsString(content);
    } catch (e) {
      print(e);
    }
  }

  Future<void> startAndroidScript() async {
    messages = [];
    update();
    if (selectedProject != null) {
      try {
        final stopwatch = Stopwatch()..start();

        final filePath =
            selectedProject!.pathProject! + selectedProject!.androidFile!;
        await createFileAndFolder(
            filePath, selectedProject!.androidConfig ?? "");

        Process process;
        if (Platform.isWindows) {
          process = await Process.start('cmd', ['/c', filePath]);
        } else if (Platform.isMacOS) {
          process = await Process.start('bash', [filePath]);
        } else {
          throw Exception('Unsupported operating system');
        }

        process.stdout.transform(utf8.decoder).listen((data) {
          if (data.isNotEmpty && data.length > 2) {
            messages.add(CommandMessageModel()..write(data.trimRight()));
            if (data.contains('Built')) {
              //apos o .apk remove o que vem depois de texto no caso app-release.apk (28.8MB). eliminar o  (28.8MB)

              final apkPath =
                  '${data.trimRight().split('Built')[1].trim().split('.apk')[0]}.apk';
              messages.add(CommandMessageModel()
                ..write(
                    'apk_path'.tr + selectedProject!.pathProject! + apkPath));
            }

            update();
            jumpToItem();
          }
        });

        process.stderr.transform(utf8.decoder).listen((data) {
          if (data.isNotEmpty && data.length > 2) {
            messages.add(
                CommandMessageModel()..write(data.trimRight(), error: true));
            update();
            jumpToItem();
          }
        });

        await process.exitCode;
        stopwatch.stop();
        messages.add(CommandMessageModel()..newLine());
        messages.add(CommandMessageModel()..write('script_finished'.tr));
        messages.add(CommandMessageModel()
          ..write('script_time'.tr + stopwatch.elapsed.toString()));
        messages.add(CommandMessageModel()..newLine());
        update();
        Future.delayed(const Duration(milliseconds: 800), () {
          jumpToItem();
        });
      } catch (e) {
        messages.add(CommandMessageModel()
          ..write(e.toString().trimRight(), error: true));
        update();
        Future.delayed(const Duration(milliseconds: 800), () {
          jumpToItem();
        });
      }
    }
  }

  void jumpToItem() {
    try {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    } catch (e) {
      log('jumpToItem erro ${e.toString()}');
    }
  }
}
