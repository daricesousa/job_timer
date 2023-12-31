import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/ui/button_with_loader.dart';
import 'package:job_timer/app/modules/project/register/controller/project_register_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  final ProjectRegisterController controller;

  const ProjectRegisterPage({super.key, required this.controller});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final editEstimate = TextEditingController();
  final editName = TextEditingController();

  @override
  void dispose() {
    editEstimate.dispose();
    editName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectRegisterController, ProjectRegisterStatus>(
      bloc: widget.controller,
      listener: (context, state) {
        switch (state) {
          case ProjectRegisterStatus.success:
            Navigator.pop(context);
            break;
          case ProjectRegisterStatus.failure:
            AsukaSnackbar.alert("Erro ao salvar projeto").show();
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Criar novo projeto',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: editName,
                    decoration:
                        const InputDecoration(label: Text("Nome do projeto")),
                    validator: Validatorless.required("Nome obrigatório"),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: editEstimate,
                    decoration: const InputDecoration(
                      label: Text("Estimativa de horas"),
                    ),
                    keyboardType: TextInputType.number,
                    validator: Validatorless.multiple([
                      Validatorless.required("Estimativa obrigatória"),
                      Validatorless.number("Apenas números")
                    ]),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 49,
                      child: ButtonWithLoader<ProjectRegisterController,
                              ProjectRegisterStatus>(
                          bloc: widget.controller,
                          selector: (state) =>
                              state == ProjectRegisterStatus.loading,
                          label: "Salvar",
                          onPressed: () async {
                            final formValid =
                                _formKey.currentState?.validate() ?? false;
                            if (formValid) {
                              final name = editName.text;
                              final estimate = int.parse(editEstimate.text);
                              await widget.controller
                                  .register(name: name, estimate: estimate);
                            }
                          }))
                ],
              ),
            )),
      ),
    );
  }
}
