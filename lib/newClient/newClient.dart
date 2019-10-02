import 'package:flutter/material.dart';
import '../share/appBar.dart';

class NewClient extends StatelessWidget {
  String routeName = '/newClient';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar.getAppBar(),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
    
          TextField(
            scrollPadding: EdgeInsets.all(20),
            decoration: InputDecoration(
              filled: true,
              labelText: 'Client Name',
            ),
          ),
          TextField(
            scrollPadding: EdgeInsets.all(20),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Contact Number',
            ),
          ),
          TextField(
            scrollPadding: EdgeInsets.all(20),
            decoration: InputDecoration(
              filled: true,
              labelText: 'Email(Optional)',
            ),
          ),
          TextField(
            scrollPadding: EdgeInsets.all(20),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              labelText: 'Amount',
          
            ),
          ),
          TextField(
            
            scrollPadding: EdgeInsets.all(20),
            decoration: InputDecoration(
              
              filled: true,
              labelText: 'Remark(Optional)',
            ),
          ),
          Row(
            children: <Widget>[
              
                Spacer(),
               OutlineButton(
                 padding: EdgeInsets.all(14),
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                 onPressed: (){print("cancel pressed");},
                 child: Text('Cancel',style: TextStyle(color: Colors.blue[700])),
                 color: Colors.blue[700],
                 
               ),
               Spacer(),
                MaterialButton(
                  height: 45,
                  
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Colors.blue[700],
                  // textTheme: ButtonTextTheme.,
                  onPressed: (){print("pressed");},
                  child: Text('Save', style: TextStyle(letterSpacing: 1,fontSize: 15,color: Colors.white,),),

                ),
               Spacer(),
            ],
          )
          
        ].map((widget){return Padding(child: widget, padding: EdgeInsets.all(10),);}).toList(),
      ),
    );
  }
}
