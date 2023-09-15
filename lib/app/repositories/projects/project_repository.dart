import 'package:job_timer/app/entities/project.dart';

abstract interface class ProjectRepository {
  Future<void> register(Project project);
}
