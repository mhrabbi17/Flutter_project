class TaskModel {
  String? title;
  String? description;
  String? status;
  String? email;
  String? createdDate;
  String? sId;

  TaskModel(
      {this.title,
        this.description,
        this.status,
        this.email,
        this.createdDate,
        this.sId});

  TaskModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    status = json['status'];
    email = json['email'];
    createdDate = json['createdDate'];
    sId = json['_id'];
  }


}