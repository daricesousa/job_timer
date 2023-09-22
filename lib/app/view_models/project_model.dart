import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/projects_status_enum.dart';
import 'package:job_timer/app/view_models/project_task_model.dart';

class ProjectModel {
  final int? id;
  final String name;
  final int estimate;
  final ProjectStatusEnum status;
  final List<ProjectTaskModel> tasks;
  ProjectModel({
    this.id,
    required this.name,
    required this.estimate,
    required this.status,
    required this.tasks,
  });

  factory ProjectModel.fromEntity(Project project) {
    project.tasks.loadSync();

    return ProjectModel(
      id: project.id,
      name: project.name,
      estimate: project.estimate,
      status: project.status,
      tasks: project.tasks.map((e) => ProjectTaskModel.fromEntity(e)).toList(),
    );
  }
}
