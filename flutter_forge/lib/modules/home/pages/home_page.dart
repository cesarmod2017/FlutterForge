import 'package:flutter_forge/exports/basic_exports.dart';
import 'package:flutter_forge/exports/get_exports.dart';
import 'package:flutter_forge/modules/home/controller/home_controller.dart';
import 'package:flutter_forge/modules/home/pages/components/home_projectConfiguration.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('home'.tr),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey.shade800,
                        width: 1,
                      ),
                      right: BorderSide(
                        color: Colors.grey.shade800,
                        width: 2,
                      ),
                    ),
                  ),
                  width:
                      constraints.maxWidth > 300 ? 300 : constraints.maxWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LabelWidget(title: "projects".tr),
                          IconButton(
                            onPressed: () async {
                              await _.addProject();
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.plus,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _.projectsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = _.projectsList[index];
                            return GestureDetector(
                              onTap: () {
                                _.selectProject(item);
                              },
                              child: Card(
                                elevation: 3,
                                borderOnForeground: true,
                                shadowColor: _.selectedProject != null &&
                                        _.selectedProject!.id == item.id
                                    ? Colors.blue
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(item.name ?? "-"),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: constraints.maxWidth,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.grey.shade800,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: Colors.grey.shade800,
                                width: 2,
                              ),
                            ),
                          ),
                          child: _.selectedProject != null
                              ? const HomeProjectConfigurationComponent()
                              : const SizedBox.shrink(),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: constraints.maxWidth,
                          child: ListView.builder(
                            controller: _.scrollController,
                            itemCount: _.messages.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = _.messages[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SelectableText(
                                  "${item.date.toString()} - ${item.message}",
                                  style: TextStyle(
                                      color: item.isError == true
                                          ? Colors.red
                                          : Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
    });
  }
}
