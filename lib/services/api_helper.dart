import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:supreox_test_task/style/style.dart';
import 'package:supreox_test_task/utils/constants/api_constants.dart';


class ApiHelper {

// // ----- Get All Item ----- // //
static Future<String> getAllItems () async {
  var url=Uri.parse("${ApiServices.baseUrl}");
  var response= await  http.get(url,headers:ApiServices.requestHeader);
  var resultCode = response.statusCode;
   if(resultCode==200){
    SuccessToast("Request Success");
    return response.body;
  }
  else{
    ErrorToast("Request fail ! try again");
    return '';
  }

}








}
