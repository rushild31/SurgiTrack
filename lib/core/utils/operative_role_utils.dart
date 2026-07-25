String normalizeOperativeRole(String? role) {
  if (role == null || role.trim().isEmpty) {
    return 'observed';
  }

  switch (role.toLowerCase().trim()) {
    case 'o':
    case 'observed':
    case 'observe':
    case 'observer':
      return 'observed';

    case 'a':
    case 'assisted':
    case 'assist':
      return 'assisted';

    case 'ps':
    case 'performed_under_supervision':
    case 'performed under supervision':
    case 'supervised':
      return 'performed_under_supervision';

    case 'pi':
    case 'performed_independently':
    case 'performed independently':
    case 'independent':
      return 'performed_independently';

    default:
      return 'observed';
  }
}
