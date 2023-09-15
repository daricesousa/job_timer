import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  const ProjectRegisterPage({super.key});

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
    return Scaffold(
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
                    child: ElevatedButton(
                        onPressed: () {
                          final formValid =
                              _formKey.currentState?.validate() ?? false;
                          if (formValid) {}
                        },
                        child: const Text("Salvar")))
              ],
            ),
          )),
    );
  }
}
