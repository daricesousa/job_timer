import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/entities/projects_status_enum.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Container(
        height: constraints.maxHeight,
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.4,
              child: DropdownButtonFormField<ProjectStatusEnum>(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  isCollapsed: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                items: ProjectStatusEnum.values
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.label),
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: constraints.maxWidth * 0.4,
              child: ElevatedButton.icon(
                onPressed: () {
                  Modular.to.pushNamed('/project/register/');
                },
                icon: const Icon(Icons.add),
                label: const Text("Novo Projeto"),
              ),
            )
          ],
        ),
      );
    }));
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
