import 'package:job_timer/app/view_models/project_model.dart';

abstract interface class ProjectService {
  Future<void> register(ProjectModel projectModel);
}
