import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';
import 'package:job_timer/app/view_models/project_model.dart';

class ProjectTile extends StatelessWidget {
  final ProjectModel project;
  const ProjectTile({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Modular.to.pushNamed('/project/detail/', arguments: project);
        Modular.get<HomeController>().loadProjects();
      },
      child: Container(
        constraints: const BoxConstraints(maxHeight: 90),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!, width: 4),
        ),
        child: Column(
          children: [
            _ProjectName(project: project),
            Expanded(child: _ProjectProgress(project: project)),
          ],
        ),
      ),
    );
  }
}

class _ProjectName extends StatelessWidget {
  final ProjectModel project;

  const _ProjectName({required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(project.name),
          Icon(
            Icons.keyboard_double_arrow_right_rounded,
            color: Theme.of(context).primaryColor,
            size: 24,
          )
        ],
      ),
    );
  }
}

class _ProjectProgress extends StatelessWidget {
  final ProjectModel project;
  const _ProjectProgress({required this.project});

  @override
  Widget build(BuildContext context) {
    final totalTasks = project.tasks
        .fold<int>(0, (previousValue, task) => previousValue += task.duration);

    var percent = 0.0;

    if (totalTasks > 0) {
      percent = totalTasks / project.estimate;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
              child: LinearProgressIndicator(
            value: percent,
            backgroundColor: Colors.grey[400]!,
            color: Theme.of(context).primaryColor,
          )),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("${project.estimate}h"),
          )
        ],
      ),
    );
  }
}
