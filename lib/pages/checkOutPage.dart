import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
    
  Map<String, dynamic>? paymentIntent;
  var secret_key = "sk_test_51MOnBRDEleESqPoxpyGL2mcTXovXfjDXLhLVdTVxlWR9ExDCxiN2VUuqkJo4s713UjgsOOWFfgPvPLntXAFhxm3r004kFJIZoe";

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('10', 'USD'); 
    await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntent!['client_secret'],
      style: ThemeMode.dark,
      merchantDisplayName: 'Adnan'
    ));
    displayPaymentSheet();
    } catch(e, s) {
       print('exception:$e$s');
    }
  }
 

  displayPaymentSheet() async {
     try {
     await Stripe.instance.presentPaymentSheet()
       .then((value) {
          showDialog(context: context,
           builder: (_) => const AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green,),
                    Text("Payment Successful"),
                  ],
                )
              ],
            ),
          ));
     }).onError((error, stackTrace){
           print('Error is:--->$error $stackTrace');
     });
     paymentIntent = null;
     } on StripeException catch (e) {
        print('Error is:---> $e');
        showDialog(context: context,
         builder: (_) => const AlertDialog(
            content: Text("Cancelled "),
          ));
     } catch(e) {
      print("$e");
     }
  }

  createPaymentIntent(String amount, String currency) async {
    Map<String, dynamic> body = {
       'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
    };
    var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          headers: {
            'Authorization': 'Bearer $secret_key',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: body,
          );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
  }
  
  String calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100 ;
    return calculatedAmout.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Screen'),
      ),
      body:  Center(
        child: ElevatedButton(
          onPressed: () async {
            await makePayment(); 
        }, child: const Text("Make Payment"))
        ),
      );
}


}

