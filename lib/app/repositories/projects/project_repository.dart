import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/projects_status_enum.dart';

abstract interface class ProjectRepository {
  Future<void> register(Project project);
  Future<List<Project>> findByStatus(ProjectStatusEnum status);
}
