enum SurgeonRole {
  observed,
  assisted,
  performedUnderSupervision,
  performedIndependently,
}

extension SurgeonRoleExtension on SurgeonRole {
  String get label {
    switch (this) {
      case SurgeonRole.observed:
        return "Observed";

      case SurgeonRole.assisted:
        return "Assisted";

      case SurgeonRole.performedUnderSupervision:
        return "Performed under Supervision";

      case SurgeonRole.performedIndependently:
        return "Performed Independently";
    }
  }

  String get value {
    switch (this) {
      case SurgeonRole.observed:
        return "observed";

      case SurgeonRole.assisted:
        return "assisted";

      case SurgeonRole.performedUnderSupervision:
        return "performed_under_supervision";

      case SurgeonRole.performedIndependently:
        return "performed_independently";
    }
  }

  static SurgeonRole fromString(String value) {
    switch (value) {
      case "observed":
        return SurgeonRole.observed;

      case "assisted":
        return SurgeonRole.assisted;

      case "performed_under_supervision":
        return SurgeonRole.performedUnderSupervision;

      case "performed_independently":
        return SurgeonRole.performedIndependently;

      default:
        return SurgeonRole.observed;
    }
  }
}
