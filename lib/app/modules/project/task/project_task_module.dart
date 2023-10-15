import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/task/controller/project_task_controller.dart';
import 'package:job_timer/app/modules/project/task/project_task_page.dart';
import 'package:job_timer/app/view_models/project_model.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class TaskModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        BlocBind.lazySingleton(
            (i) => ProjectTaskController(projectService: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) {
          final ProjectModel project = args.data;
          return ProjectTaskPage(
              controller: Modular.get()..setProject(project));
        }),
      ];
}
