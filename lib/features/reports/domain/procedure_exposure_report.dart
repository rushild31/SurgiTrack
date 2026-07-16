class ProcedureExposureReport {
  final String procedureName;

  final int totalCases;

  final int observed;

  final int assisted;

  final int supervised;

  final int independent;

  const ProcedureExposureReport({
    required this.procedureName,
    required this.totalCases,
    required this.observed,
    required this.assisted,
    required this.supervised,
    required this.independent,
  });

  int get totalExposure => observed + assisted + supervised + independent;
}
