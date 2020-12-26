class AppConstants {
  static const String NOTIFICATION = 'Notification';
  static const String TASKS = 'Tasks';
  static const String LOW = 'low';
  static const String HIGH = 'high';
  static const String SUCCESS = 'success';
  static const String MEDIUM = 'medium';
  static const Map PRIORITY_OBJECT = {
    'high': 1,
    'medium': 2,
    'low': 3,
  };
  static const List<String> TOGGLE_BUTTON_LIST = [
    'Friends',
    'Private',
    'Annonymous',
  ];
  static const Duration snackBarDuration = Duration(milliseconds: 700);
}
