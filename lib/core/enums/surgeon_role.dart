enum SurgeonRole { observed, assisted, supervised, independent }

extension SurgeonRoleExtension on SurgeonRole {
  String get label {
    switch (this) {
      case SurgeonRole.observed:
        return "Observed";

      case SurgeonRole.assisted:
        return "Assisted";

      case SurgeonRole.supervised:
        return "Performed under Supervision";

      case SurgeonRole.independent:
        return "Performed Independently";
    }
  }
}
