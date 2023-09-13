enum ProjectStatusEnum {
  inProgress(label: "Em andamento"),
  finished(label: "Finalizado");

  final String label;

  const ProjectStatusEnum({required this.label});
}
