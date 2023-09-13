import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/ui/database/database.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/projects_status_enum.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Container(),
          ElevatedButton(
              onPressed: () async {
                final db = Modular.get<Database>();
                final connection = await db.openConnection();
                connection.writeTxn(() {
                  var project = Project(
                      // name: "Projeto teste",
                      // status: ProjectStatusEnum.inProgress
                      );
                  project.name = "Projeto teste";
                  project.status = ProjectStatusEnum.inProgress;
                  return connection.projects.put(project);
                });
              },
              child: const Text("Cadastrar"))
        ],
      ),
    );
  }
}
