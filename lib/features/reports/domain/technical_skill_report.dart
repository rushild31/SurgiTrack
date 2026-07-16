class TechnicalSkillReport {
  final String skillName;

  final int exposure;

  final int observed;

  final int assisted;

  final int supervised;

  final int independent;

  const TechnicalSkillReport({
    required this.skillName,
    required this.exposure,
    required this.observed,
    required this.assisted,
    required this.supervised,
    required this.independent,
  });

  int get calculatedExposure => observed + assisted + supervised + independent;
}
