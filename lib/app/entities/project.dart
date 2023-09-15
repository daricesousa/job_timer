import 'package:isar/isar.dart';
import 'package:job_timer/app/entities/project_task.dart';
import 'package:job_timer/app/entities/projects_status_enum.dart';

part 'project.g.dart';

@collection
class Project {
  Id? id = Isar.autoIncrement;
  late String name;
  late int estimate;

  @enumerated
  late ProjectStatusEnum status;

  final task = IsarLinks<ProjectTask>();
}
