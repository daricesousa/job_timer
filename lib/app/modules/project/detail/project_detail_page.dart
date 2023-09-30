import 'package:flutter/material.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_detail_appbar.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_pie_chart.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_task_tile.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
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
    ]));
  }
}
