class MinimumOrder{
  final int amount;
  final  String currency;

  MinimumOrder({this.amount,this.currency});

 factory MinimumOrder.fromMap(Map<String , dynamic> map){
   return MinimumOrder(
    amount :map['amount'],
    currency : map['currency']);
  }

  @override
  String toString() {
    return 'MinimumOrder{amount: $amount, currency: $currency}';
  }
}