import 'package:flutter_forge/exports/basic_exports.dart';
import 'package:flutter_forge/modules/home/controller/home_controller.dart';
import 'package:flutter_forge/widgets/flutter_code_edit.dart';
import 'package:flutter_forge/widgets/widgets_exports.dart';
import 'package:get/get.dart';

class HomeProjectConfigurationComponent extends StatelessWidget {
  const HomeProjectConfigurationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                CustomTextField(
                  controller: _.selectedProject!.projectNameController!,
                  hint: "project_name_placeholder".tr,
                  label: "project_name".tr,
                  keyboardType: TextInputType.text,
                  onChanged: (value) async {
                    await _.changeProjectName(value);
                  },
                ),
                CustomTextField(
                  controller: _.selectedProject!.projectPathController!,
                  hint: "project_path_placeholder".tr,
                  label: "project_path".tr,
                  keyboardType: TextInputType.text,
                  onChanged: (value) async {
                    await _.changeProjectPath(value);
                  },
                ),
                CustomTextField(
                  controller: _.selectedProject!.androidFileController!,
                  hint: "project_android_file_placeholder".tr,
                  label: "project_android_file".tr,
                  keyboardType: TextInputType.text,
                  onChanged: (value) async {
                    await _.changeAndroidFile(value);
                  },
                ),
                CustomTextField(
                  controller: _.selectedProject!.iosFileController!,
                  hint: "project_ios_file_placeholder".tr,
                  label: "project_ios_file".tr,
                  keyboardType: TextInputType.text,
                  onChanged: (value) async {
                    await _.changeIosFile(value);
                  },
                ),
                25.toHeightSpace(),
                Row(
                  children: [
                    Flexible(
                      child: PrimaryButtonWidget(
                        titleButtom: "project_android_config".tr,
                        onTap: () {
                          _.setConfigType(true);
                        },
                      ),
                    ),
                    25.toWidthSpace(),
                    Flexible(
                      child: PrimaryButtonWidget(
                        titleButtom: "project_ios_config".tr,
                        onTap: () {
                          _.setConfigType(false);
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          25.toWidthSpace(),
          Flexible(
            flex: 3,
            child: _.configType == null
                ? Container()
                : Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LabelWidget(
                                    title: _.configType == true
                                        ? "project_android_config".tr
                                        : "project_ios_config".tr,
                                  ),
                                  10.toHeightSpace(),
                                  CodeEditorPage(
                                    controller: _.configType == true
                                        ? _.selectedProject!
                                            .androidConfigController!
                                        : _.selectedProject!
                                            .iosConfigController!,
                                    onChanged: (value) async {
                                      if (_.configType == null) return;
                                      if (_.configType == true) {
                                        await _.changeAndroidConfig(value);
                                      } else if (_.configType == false) {
                                        await _.changeIosConfig(value);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        25.toHeightSpace(),
                        SizedBox(
                          width: 200,
                          child: PrimaryButtonWidget(
                            titleButtom: "execute_script".tr,
                            onTap: () async {
                              await _.startAndroidScript();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ],
      );
    });
  }
}
