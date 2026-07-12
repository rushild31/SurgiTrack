extension DateTimeExtension on DateTime {
  int get age {
    final today = DateTime.now();

    int years = today.year - year;

    if (today.month < month || (today.month == month && today.day < day)) {
      years--;
    }

    return years;
  }
}
