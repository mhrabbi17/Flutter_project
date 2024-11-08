class URLs{
  static const String _baseUrl = "http://35.73.30.144:2005/api/v1";

  static const String registration = "$_baseUrl/registration";
  static const String login = "$_baseUrl/login";
  static const String addNewTask = "$_baseUrl/createTask";
  static const String newTaskList = "$_baseUrl/listTaskByStatus/New";
  static const String completedTaskList = "$_baseUrl/listTaskByStatus/Completed";
  static const String taskStatusCount = "$_baseUrl/taskStatusCount";
  static  String changeStatus(String taskID, String status) =>
      "$_baseUrl/updateTaskStatus/$taskID/$status";
  static  String deleteTask(String taskID) =>
      "$_baseUrl/deleteTask/$taskID";
}