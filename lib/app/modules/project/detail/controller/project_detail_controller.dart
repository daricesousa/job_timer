import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/view_models/project_model.dart';

part 'project_detail_state.dart';

class ProjectDetailController extends Cubit<ProjectDetailState> {
  ProjectDetailController() : super(const ProjectDetailState.initial());

  void setProject(ProjectModel project) {
    emit(state.copyWith(
        projectModel: project, status: ProjectDetailStatus.success));
  }
}
