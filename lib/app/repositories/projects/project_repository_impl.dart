import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:job_timer/app/core/exceptions/failure.dart';
import 'package:job_timer/app/core/ui/database/database.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_task.dart';
import 'package:job_timer/app/entities/projects_status_enum.dart';

import './project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final Database _database;

  ProjectRepositoryImpl({required Database database}) : _database = database;

  @override
  Future<void> register(Project project) async {
    try {
      final connection = await _database.openConnection();

      await connection.writeTxn(() {
        return connection.projects.put(project);
      });
    } on IsarError catch (e, s) {
      const message = "Erro ao cadastrar projeto";
      log(message, error: e, stackTrace: s);
      throw Failure(message: message);
    }
  }

  @override
  Future<List<Project>> findByStatus(ProjectStatusEnum status) async {
    final connection = await _database.openConnection();
    final projects =
        await connection.projects.filter().statusEqualTo(status).findAll();
    return projects;
  }

  @override
  Future<Project> findById(int projectId) async {
    final connection = await _database.openConnection();
    final project = await connection.projects.get(projectId);
    if (project == null) {
      throw Failure(message: "Projeto não encontrado");
    } else {
      return project;
    }
  }

  @override
  Future<Project> addTask(
      {required int projectId, required ProjectTask task}) async {
    final connection = await _database.openConnection();
    await connection.writeTxn(() async {
      await connection.projectTasks.put(task);
    });
    final project = await findById(projectId);
    project.tasks.add(task);
    await connection.writeTxn(() => project.tasks.save());
    return project;
  }

  @override
  Future<void> finish(int projectId) async {
    try {
      final connection = await _database.openConnection();
      final project = await findById(projectId);
      project.status = ProjectStatusEnum.finished;
      await connection.writeTxn(() => connection.projects.put(project));
    } on IsarError catch (e, s) {
      log(e.message, error: e, stackTrace: s);
      throw Failure(message: "Erro ao finalizar projeto");
    }
  }
}
