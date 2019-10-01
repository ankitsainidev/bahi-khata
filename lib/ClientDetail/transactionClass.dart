class TransactionClass{
  String date;
  String time;
  double money;
  String action;
  TransactionClass({String date: '25-10-2018', String time: '11:40 AM', double money: 77}){
    this.date = date;
    this.time = time;
    this.money = money;
    this.action = money<0?'Paid':'Received';
  }
}