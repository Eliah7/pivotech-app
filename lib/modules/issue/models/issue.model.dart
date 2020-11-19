class Issue{
  String issueName;
  Map<String, dynamic> dateIssued;
  String description;
  String car;
  IssueStatus status;
  String imageUrl;

  Issue({this.issueName, this.dateIssued, this.car, this.description, this.status, this.imageUrl});
}

enum IssueStatus{
  ACTIVE, PROCESSED, DONE, CANCELLED
}