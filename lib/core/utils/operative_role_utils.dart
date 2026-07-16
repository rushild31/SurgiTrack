String normalizeOperativeRole(String? role) {
  if (role == null || role.trim().isEmpty) {
    return 'observed';
  }

  switch (role.toLowerCase().trim()) {
    case 'observed':
    case 'observe':
    case 'observer':
      return 'observed';

    case 'assisted':
    case 'assist':
      return 'assisted';

    case 'performed_under_supervision':
    case 'performed under supervision':
    case 'supervised':
      return 'performed_under_supervision';

    case 'performed_independently':
    case 'performed independently':
    case 'independent':
      return 'performed_independently';

    default:
      return 'observed';
  }
}
