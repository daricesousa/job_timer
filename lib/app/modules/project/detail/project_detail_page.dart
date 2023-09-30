import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          AsukaSnackbar.alert("Erro interno");
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
    return CustomScrollView(
      slivers: [
        ProjectDetailAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: ProjectPieChart(),
              ),
              const ProjectTaskTile(),
              const ProjectTaskTile(),
              const ProjectTaskTile(),
              const ProjectTaskTile(),
            ],
          ),
        ),
        SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text("Finalizar projeto")),
              ),
            ))
      ],
    );
  }
}
