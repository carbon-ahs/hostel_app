import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hostel_app/ui/payment/widgets/build_pay_now_card.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 4.0,
              bottom: 4.0,
              left: 8.0,
              right: 8.0,
            ),
            child: BuildPayNowCard(
              title: "July Academic Payment",
              onPayTap: () => payNow(1500),
            ),
          );
        },
      ),
    );
  }

  Future<void> payNow(double p_total_amount) async {
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        currency: SSLCurrencyType.BDT,
        product_category: "Food",
        sdkType: SSLCSdkType.TESTBOX,
        store_id: "mobil5fe45035efe16",
        store_passwd: "mobil5fe45035efe16@ssl",
        total_amount: p_total_amount,
        // tran_id: "emth4741965"),
        tran_id: "CareHostelPay",
      ),
    );

    try {
      SSLCTransactionInfoModel result = await sslcommerz.payNow();
      if (result is PlatformException) {
        debugPrint(result.status);
      } else {
        if (result.status!.toLowerCase() == "failed") {
          print('Transaction is Failed....');
          await Fluttertoast.showToast(
              msg: "Transaction is Failed....",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          print(
              "Transaction is ${result.status} and Amount is ${result.amount}");
          await Fluttertoast.showToast(
            msg:
                "Transaction is ${result.status} and Amount is ${result.amount}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
