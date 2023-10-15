import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/entities/projects_status_enum.dart';
import 'package:job_timer/app/modules/project/detail/controller/project_detail_controller.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_detail_appbar.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_pie_chart.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_task_tile.dart';
import 'package:job_timer/app/view_models/project_model.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectDetailController controller;
  const ProjectDetailPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<ProjectDetailController, ProjectDetailState>(
      bloc: controller,
      listener: (context, state) {
        if (state.status == ProjectDetailStatus.failure) {
          AsukaSnackbar.alert("Erro interno").show();
        }
      },
      builder: (context, state) {
        final project = state.projectModel;
        switch (state.status) {
          case ProjectDetailStatus.initial:
            return const Center(child: Text("carregando projeto"));
          case ProjectDetailStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case ProjectDetailStatus.success:
            return _buildProjectDetail(context, project!);
          case ProjectDetailStatus.failure:
            if (project == null) {
              return _buildProjectDetail(context, project!);
            }
            return const Center(child: Text("Erro ao carregar projeto"));
        }
      },
    ));
  }

  Widget _buildProjectDetail(BuildContext context, ProjectModel project) {
    final totalTasks =
        project.tasks.fold(0, (totalValue, task) => totalValue + task.duration);

    return CustomScrollView(
      slivers: [
        ProjectDetailAppBar(
          project: project,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: ProjectPieChart(
                  projectEstimate: project.estimate,
                  totalTasks: totalTasks,
                ),
              ),
              ...project.tasks
                  .map((task) => ProjectTaskTile(
                        task: task,
                      ))
                  .toList(),
            ],
          ),
        ),
        SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Visibility(
                  visible: project.status != ProjectStatusEnum.finished,
                  child: ElevatedButton.icon(
                      onPressed: controller.finishProject,
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text("Finalizar projeto")),
                ),
              ),
            ))
      ],
    );
  }
}
