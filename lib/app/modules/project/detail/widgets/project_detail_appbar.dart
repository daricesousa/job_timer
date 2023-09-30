import 'package:flutter/material.dart';

class ProjectDetailAppBar extends SliverAppBar {
  ProjectDetailAppBar({super.key})
      : super(
          expandedHeight: 100,
          pinned: true,
          toolbarHeight: 100,
          title: const Text("Projeto X"),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          flexibleSpace: Stack(
            children: [
              Align(
                alignment: const Alignment(0, 1.6),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("10 tasks"),
                          _NewTasks(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
}

class _NewTasks extends StatelessWidget {
  const _NewTasks();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const Text("Adicionar Task")
      ],
    );
  }
}
