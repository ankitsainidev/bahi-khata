import 'package:flutter/material.dart';

class CardButton extends StatelessWidget{
  final String _value;
  final String nextRoute;
  CardButton(this._value,{this.nextRoute: '/'});
  @override
  Widget build(BuildContext context) {
   
    return Container(
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      height: MediaQuery.of(context).size.height/4,
      child: MaterialButton(
        minWidth: double.infinity,
        height: double.infinity,
        child: Center(child: Text(this._value),),
        onPressed: (){
          Navigator.pushNamed(context, this.nextRoute,); 
        },
      ),
    );
  }
}
