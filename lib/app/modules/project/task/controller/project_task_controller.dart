import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_model.dart';
import 'package:job_timer/app/view_models/project_task_model.dart';

part 'project_task_state.dart';

class ProjectTaskController extends Cubit<ProjectTaskStatus> {
  final ProjectService _projectService;
  late final ProjectModel _project;

  ProjectTaskController({required ProjectService projectService})
      : _projectService = projectService,
        super(ProjectTaskStatus.initial);

  void setProject(ProjectModel project) => _project = project;

  Future<void> register({required String name, required int duration}) async {
    try {
      emit(ProjectTaskStatus.loading);
      await _projectService.addTask(
        projectId: _project.id!,
        task: ProjectTaskModel(name: name, duration: duration),
      );
      emit(ProjectTaskStatus.success);
    } catch (e, s) {
      log("Erro ao salvar task", error: e, stackTrace: s);
      emit(ProjectTaskStatus.failure);
    }
  }
}
