enum SurgeonRole {
  observed,
  assisted,
  performedUnderSupervision,
  performedIndependently,
}

extension SurgeonRoleExtension on SurgeonRole {
  /// Full human-readable label
  String get label {
    switch (this) {
      case SurgeonRole.observed:
        return 'Observed';

      case SurgeonRole.assisted:
        return 'Assisted';

      case SurgeonRole.performedUnderSupervision:
        return 'Performed under Supervision';

      case SurgeonRole.performedIndependently:
        return 'Performed Independently';
    }
  }

  /// Short UI abbreviation
  String get abbreviation {
    switch (this) {
      case SurgeonRole.observed:
        return 'O';

      case SurgeonRole.assisted:
        return 'A';

      case SurgeonRole.performedUnderSupervision:
        return 'PS';

      case SurgeonRole.performedIndependently:
        return 'PI';
    }
  }

  /// Canonical database / analytics value
  String get value {
    switch (this) {
      case SurgeonRole.observed:
        return 'observed';

      case SurgeonRole.assisted:
        return 'assisted';

      case SurgeonRole.performedUnderSupervision:
        return 'performed_under_supervision';

      case SurgeonRole.performedIndependently:
        return 'performed_independently';
    }
  }

  static SurgeonRole fromString(String? value) {
    switch (value?.toLowerCase().trim()) {
      case 'o':
      case 'observed':
      case 'observe':
      case 'observer':
        return SurgeonRole.observed;

      case 'a':
      case 'assisted':
      case 'assist':
        return SurgeonRole.assisted;

      case 'ps':
      case 'performed_under_supervision':
      case 'performed under supervision':
      case 'supervised':
        return SurgeonRole.performedUnderSupervision;

      case 'pi':
      case 'performed_independently':
      case 'performed independently':
      case 'independent':
        return SurgeonRole.performedIndependently;

      default:
        return SurgeonRole.observed;
    }
  }
}
