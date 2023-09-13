import 'package:flutter/material.dart';
import 'package:swapit_app/models/swap_card.dart';

class CardDetails extends StatelessWidget {
  final SwapCard card;

  const CardDetails({super.key, required this.card});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Details"),
      ),
      body: Center(
        child: Text(
            " user: ${card.getUidH1} \n user: ${card.getUidH2} \n item: ${card.getBpItem1} \n item: ${card.getBpItem2} \n date: ${card.getSwapDate}",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  backgroundColor: Colors.black87,
                )),
      ),
    );
  }
}
