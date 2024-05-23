import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EsewaService {
  var CLIENT_ID = " JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R ";
  var SECRET_KEY = "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==";

  void useeswa() {
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: CLIENT_ID,
          secretId: SECRET_KEY,
        ),
        esewaPayment: EsewaPayment(
          productId: "1d71jd81",
          productName: "Product One",
          productPrice: "20",
          callbackUrl: '',
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
          debugPrint(":::SUCCESS::: => $data");
          verifyTransactionStatus(data);
        },
        onPaymentFailure: (data) {
          debugPrint(":::FAILURE::: => $data");
        },
        onPaymentCancellation: (data) {
          debugPrint(":::CANCELLATION::: => $data");
        },
      );
    } on Exception catch (e) {
      debugPrint("EXCEPTION : ${e.toString()}");
    }
  }

  Future<void> verifyTransactionStatus(EsewaPaymentSuccessResult result) async {
    var response = await http.get(
      Uri.parse(
        "https://rc.esewa.com.np/mobile/transaction?txnRefId=${result.refId} ",
      ),
    );
    if (response.statusCode == 200) {
      // var map = {'data': response.body};
      // final sucResponse = EsewaPaymentSuccessResponse.fromJson(map);
      debugPrint("Response Code => ${response.body}");
      // if (sucResponse.data[0].transactionDetails.status == 'COMPLETE') {
      //   return;
      // }
    } else {}
  }
}
