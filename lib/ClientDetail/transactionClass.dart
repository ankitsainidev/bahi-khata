class TransactionClass{
  String date;
  String time;
  String money;
  String action;
  String remark;
  TransactionClass({String date: '...', String time: '...', String money: '0', String remark: 'no remark'}){
    this.date = date;
    this.time = time;
    this.money = money;
    this.remark = remark;
    this.action = int.parse(money)<0?'Paid':'Received';
  }
}