import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("URL: $linkurl");
        Map responsebody = jsonDecode(response.body);
        print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}












// class Crud {
//   Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
//     try {
//       if (await checkInternet()) {
//         var response = await http.post(Uri.parse(linkurl), body: data);

//         print("STATUS CODE:::::::: ${response.statusCode}");
//         //print("RESPONSE BODY:");
//         //print(response.body); // اطبع النص اللي جاي من السيرفر

//         if (response.statusCode == 200 || response.statusCode == 201) {
//           try {
//             Map responsebody = jsonDecode(response.body);
//             return Right(responsebody);
//           } catch (e) {
//             print("JSON DECODE ERROR:::::: $e");
//             return const Left(StatusRequest.serverEcxeption);
//           }
//         } else {
//           return const Left(StatusRequest.serverfailure);
//         }
//       } else {
//         return const Left(StatusRequest.offlinefailure);
//       }
//     } catch (e) {
//       print("REQUEST EXCEPTION: $e");
//       return const Left(StatusRequest.serverEcxeption);
//     }
//   }
// }













// import 'dart:convert';
// import 'package:dartz/dartz.dart';
// import 'package:ecommerce_cource/core/class/statusRequest.dart';
// import 'package:ecommerce_cource/core/functions/check_internet.dart';
// import 'package:http/http.dart' as http;

// class Crud {
//   //dartz=either===fold---two return.
//   Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
//     try {
//       if (await checkInternet()) {
//         var response = await http.post(Uri.parse(linkurl), body: data);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map responsebody = jsonDecode(response.body);
//           return Right(responsebody);
//         } else {
//           return const Left(StatusRequest.serverfailure);
//         }
//       } else {
//         return const Left(StatusRequest.offlinefailure);
//       }
//     } catch (_) {
//       return const Left(StatusRequest.serverEcxeption);
//     }
//   }
// }
