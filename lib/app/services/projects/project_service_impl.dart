import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_task.dart';
import 'package:job_timer/app/entities/projects_status_enum.dart';
import 'package:job_timer/app/repositories/projects/project_repository.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_model.dart';
import 'package:job_timer/app/view_models/project_task_model.dart';

class ProjectServiceImpl implements ProjectService {
  final ProjectRepository _repository;

  ProjectServiceImpl({required ProjectRepository repository})
      : _repository = repository;

  @override
  Future<void> register(ProjectModel projectModel) async {
    final project = Project()
      ..id = projectModel.id
      ..name = projectModel.name
      ..estimate = projectModel.estimate
      ..status = projectModel.status;
    await _repository.register(project);
  }

  @override
  Future<List<ProjectModel>> findByStatus(ProjectStatusEnum status) async {
    final projects = await _repository.findByStatus(status);
    return projects.map(ProjectModel.fromEntity).toList();
  }

  @override
  Future<ProjectModel> findById(int projectId) async {
    final project = await _repository.findById(projectId);
    return ProjectModel.fromEntity(project);
  }

  @override
  Future<ProjectModel> addTask(
      {required int projectId, required ProjectTaskModel task}) async {
    final projectTask = ProjectTask()
      ..id = task.id
      ..name = task.name
      ..duration = task.duration;
    final project =
        await _repository.addTask(projectId: projectId, task: projectTask);
    return ProjectModel.fromEntity(project);
  }

  @override
  Future<void> finish(int projectId) async {
    await _repository.finish(projectId);
  }
}
