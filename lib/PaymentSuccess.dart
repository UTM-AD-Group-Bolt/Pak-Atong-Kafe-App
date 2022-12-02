/*import 'package:flutter/material.dart';

class PaymentSuccess extends StatelessWidget {


}*/

import 'package:flutter/material.dart';
//import 'package:paystack_manager/paystack_pay_manager.dart';
/*Payment(
  prefixIcon:
  Icon(
  Icons.done_outlined, )
  color: Colors.green,
  )
  void _onPaymentSuccessful(Transaction transaction) {
    print('Transaction succesful');
    print(
        "Transaction message ==> ${transaction.message}, Ref ${transaction.refrenceNumber}");

  }*/


//class HomePage extends StatefulWidget {
//HomePage({Key key}) : super(key: key);
class PaymentSuccess extends statelessWidget {
  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

prefixIcon:
Icon(
Icons.done_outlined, )
color: Colors.green,
)
void _onPaymentSuccessful(Transaction transaction) {
  print('Transaction succesful');
  print(
      "Transaction message ==> ${transaction.message}, Ref ${transaction.refrenceNumber}");

}

class _PaymentSuccessState extends State<PaymentSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Payment Integration',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: MaterialButton(
              onPressed: () => _checkPayment(),
              child: Text('Proceed to Payment'),
              color: Colors.green,
            )),
      ),
    );
  }

  void _checkPayment() {
    try {
      PaystackPayManager(context: context)
        ..setSecretKey("YOUR-SECRET-KEY")
      // ..setCompanyAssetImage(Image(image: NetworkImage("YOUR-IMAGE-URL")))
        ..setAmount(100000)
        ..setReference(DateTime.now().millisecondsSinceEpoch.toString())
        ..setCurrency("NGN")
        ..setEmail("ashrafurpakatong@gmail.com")
        ..setFirstName("Ashrafur")
        ..setLastName("Rahman")
        ..setMetadata(
          {
            "custom_fields": [
              {
                "value": "PakAtongKafe",
                "display_name": "Payment_to",
                "variable_name": "Payment_to"
              }
            ]
          },
        )
        ..onSuccesful(_onPaymentSuccessful)
        ..onPending(_onPaymentPending)
        ..onFailed(_onPaymentFailed)
        ..onCancel(_onCancel)
        ..initialize();
    } catch (error) {
      print('Payment Error ==> $error');
    }
  }

  void _onPaymentSuccessful(Transaction transaction) {
    print('Transaction succesful');
    print(
        "Transaction message ==> ${transaction.message}, Ref ${transaction.refrenceNumber}");
  }

  void _onPaymentPending(Transaction transaction) {
    print('Transaction Pending');
    print("Transaction Ref ${transaction.refrenceNumber}");
  }

  void _onPaymentFailed(Transaction transaction) {
    print('Transaction Failed');
    print("Transaction message ==> ${transaction.message}");
  }

  void _onCancel(Transaction transaction) {
    print('Transaction Cancelled');
  }
}
}