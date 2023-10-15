import 'package:job_timer/app/entities/projects_status_enum.dart';
import 'package:job_timer/app/view_models/project_model.dart';
import 'package:job_timer/app/view_models/project_task_model.dart';

abstract interface class ProjectService {
  Future<void> register(ProjectModel projectModel);
  Future<List<ProjectModel>> findByStatus(ProjectStatusEnum status);
  Future<ProjectModel> findById(int projectId);
  Future<ProjectModel> addTask(
      {required int projectId, required ProjectTaskModel task});
  Future<void> finish(int projectId);
}
