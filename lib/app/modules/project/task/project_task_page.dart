import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/ui/button_with_loader.dart';
import 'package:job_timer/app/modules/project/task/controller/project_task_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectTaskPage extends StatefulWidget {
  final ProjectTaskController controller;
  const ProjectTaskPage({super.key, required this.controller});

  @override
  State<ProjectTaskPage> createState() => _ProjectTaskPageState();
}

class _ProjectTaskPageState extends State<ProjectTaskPage> {
  final formKey = GlobalKey<FormState>();
  final editName = TextEditingController();
  final editDuration = TextEditingController();

  @override
  void dispose() {
    editName.dispose();
    editDuration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectTaskController, ProjectTaskStatus>(
      bloc: widget.controller,
      listener: (context, state) {
        if (state == ProjectTaskStatus.success) {
          Navigator.pop(context);
        } else if (state == ProjectTaskStatus.failure) {
          AsukaSnackbar.alert("Erro ao salvar Task").show();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Criar nova task',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: editName,
                  validator: Validatorless.required("Campo obrigatório"),
                  decoration: const InputDecoration(
                    label: Text("Nome da task"),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: editDuration,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Duração da task"),
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required("Campo obrigatório"),
                    Validatorless.number("Apenas números")
                  ]),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 49,
                  child: ButtonWithLoader<ProjectTaskController,
                      ProjectTaskStatus>(
                    bloc: widget.controller,
                    selector: (state) => state == ProjectTaskStatus.loading,
                    onPressed: () {
                      final formValid =
                          formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        final duration = int.parse(editDuration.text);
                        widget.controller
                            .register(name: editName.text, duration: duration);
                      }
                    },
                    label: "Salvar",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
