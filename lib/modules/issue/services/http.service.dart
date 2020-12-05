import 'package:bfast/bfast.dart';
import 'package:injectable/injectable.dart';

@injectable
class HttpService {
  String serverUrl = "https://pivotech-daas.bfast.fahamutech.com/v2";

  Future<dynamic> createIssue(dynamic issue) async {
    var response = await BFast.functions().request(serverUrl).post({
      "applicationId": "pivotech",
      "createissue": {
        "issueName" : issue.issueName,
        "dateIssued" : issue.dateIssued,
        "description" : issue.description,
        "car" : issue.car,
        "status" : issue.status.toString()
      }
    });
    return response["createissue"];
  }

  Future<List<dynamic>> getIssues({size: int, step: int}) async{
    var response = await BFast.functions().request(serverUrl).post({
      "applicationId": "pivotech",
      "queryissue": {
        // "size": size,
        // "step": step,
       "return": []
      }
    });
    return response["queryissue"];
  }
}
