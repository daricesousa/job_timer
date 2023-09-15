import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:job_timer/app/core/exceptions/failure.dart';
import 'package:job_timer/app/core/ui/database/database.dart';
import 'package:job_timer/app/entities/project.dart';

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
}
