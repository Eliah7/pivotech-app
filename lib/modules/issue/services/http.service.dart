import 'package:bfast/bfast.dart';

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
        "status" : issue.staus.toString()
      }
    });
    print(response["createissue"]);
    return response["createissue"];
  }

  Future<List<dynamic>> getIssue({size: int, step: int}) async{
    var response = await BFast.functions().request(serverUrl).post({
      "applicationId": "moneychange",
      "queryissue": {
        // "size": size,
        // "step": step,
       "return": []
      }
    });
    return response["queryissue"];
  }
}
