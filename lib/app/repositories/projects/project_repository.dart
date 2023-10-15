import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_task.dart';
import 'package:job_timer/app/entities/projects_status_enum.dart';

abstract interface class ProjectRepository {
  Future<void> register(Project project);
  Future<List<Project>> findByStatus(ProjectStatusEnum status);
  Future<Project> findById(int projectId);
  Future<Project> addTask({required int projectId, required ProjectTask task});
  Future<void> finish(int ProjectId);
}
