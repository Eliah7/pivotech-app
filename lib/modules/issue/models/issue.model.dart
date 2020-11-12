class Issue{
  String issueName;
  String dateIssued;
  String description;
  String car;
  IssueStatus status;

  Issue({this.issueName, this.dateIssued, this.car, this.description, this.status});
}

enum IssueStatus{
  ACTIVE, PROCESSED, DONE, CANCELLED
}