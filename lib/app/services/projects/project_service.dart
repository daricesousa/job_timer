import 'package:job_timer/app/entities/projects_status_enum.dart';
import 'package:job_timer/app/view_models/project_model.dart';

abstract interface class ProjectService {
  Future<void> register(ProjectModel projectModel);
  Future<List<ProjectModel>> findByStatus(ProjectStatusEnum status);
}
