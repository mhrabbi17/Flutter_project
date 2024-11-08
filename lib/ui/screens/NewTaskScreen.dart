import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/models/task_status_count_model.dart';
import 'package:task_manager/data/models/task_status_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/Add_NewTaskScreen.dart';
import 'package:task_manager/ui/widgets/TaskCard.dart';
import 'package:task_manager/ui/widgets/TaskSummaryCard.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getNewTaskListInProgress = false;
  bool _getTaskStatusCountListInProgress = false;
  List<TaskModel> _newTaskList = [];
  List<TaskStatusModel> _taskStatusCountList = [];

  @override
  void initState() {
    super.initState();
    _getNewTaskList();
    _getTaskStatusCount();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          _getNewTaskList();
          _getTaskStatusCount();
        },
        child: Column(
          children: [
            _buildSummarySection(),
            Expanded(
                child: Visibility(
                  visible: !_getNewTaskListInProgress,
                  replacement: const CenteredCircularProgressIndicator(),
                  child: ListView.separated(
                    itemCount: _newTaskList.length,
                    itemBuilder: (context, index) {
                      return TaskCard(
                        taskmodel: _newTaskList[index],
                        onRefreshList: (){
                          _getNewTaskList();
                        },
                      );
                      },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 8,
                      );},
                  ),
                ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onTapFAB();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Padding _buildSummarySection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Visibility(
        visible: _getTaskStatusCountListInProgress == false,
        replacement: CircularProgressIndicator(),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _getTaskSummaryCardList(),
          ),
        ),
      ),
    );
  }
  List<TaskSummaryCard> _getTaskSummaryCardList(){
    List<TaskSummaryCard> taskSummaryCardList = [];
    for(TaskStatusModel t in _taskStatusCountList){
      taskSummaryCardList.add(TaskSummaryCard(title: t.sId!, count: t.sum ?? 0));
    }
    return taskSummaryCardList;
  }

  Future<void> _onTapFAB() async {
    final bool? shouldRefresh = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddNewtaskscreen(),
        ));
    if(shouldRefresh == true){
      _getNewTaskList();
    }
    else{}
  }
  Future<void> _getNewTaskList()async{
    _newTaskList.clear();
    _getNewTaskListInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(
      URLs.newTaskList
    );
    if(response.isSuccess){
      final TaskListModel taskListModel = TaskListModel.fromJson(response.responseData);
      _newTaskList = taskListModel.taskList?? [];
    }
    else{
      showSnackBarMessage(context, response.errorMessage,true);
    }
    _getNewTaskListInProgress = false;
    setState(() {});
  }
  Future<void> _getTaskStatusCount()async{
    _taskStatusCountList.clear();
    _getTaskStatusCountListInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(
        URLs.taskStatusCount);
    if(response.isSuccess){
      final TaskStatusCountModel taskStatusCountModel =
      TaskStatusCountModel.fromJson(response.responseData);
      _taskStatusCountList = taskStatusCountModel.taskStatusCountList?? [];
    }
    else{
      showSnackBarMessage(context, response.errorMessage,true);
    }
    _getTaskStatusCountListInProgress = false;
    setState(() {});
  }
}
