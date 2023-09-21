enum ProjectStatusEnum {
  inProgress,
  finished;

  String get label {
    switch (this) {
      case ProjectStatusEnum.inProgress:
        return "Em andamento";
      case ProjectStatusEnum.finished:
        return "Finalizado";
    }
  }
}
