import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/entities/projects_status_enum.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_model.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final ProjectService _projectService;

  HomeController({required ProjectService projectService})
      : _projectService = projectService,
        super(HomeState.initial());

  Future<void> loadProjects({ProjectStatusEnum? newStatus}) async {
    try {
      final status = newStatus ?? state.projectFilter;
      emit(state.copyWith(status: HomeStatus.loading, projects: []));
      final projects = await _projectService.findByStatus(status);
      emit(state.copyWith(
          status: HomeStatus.success,
          projects: projects,
          projectFilter: status));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
