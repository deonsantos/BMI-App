import 'package:flutter/material.dart';

import 'colors.dart';
class DrawerContainer extends StatefulWidget {

  @override
  _DrawerContainerState createState() => _DrawerContainerState();
}

class _DrawerContainerState extends State<DrawerContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: primaryColor),
          currentAccountPicture: CircleAvatar(),
          accountName: Text("Citizen John"),
           accountEmail: Text ("johndoe@gmail.com"),
           ),


           ListTile(
        title:Text("Contact me"),
        leading: Icon(Icons.call),
        subtitle:Text("0541643189"),
        
        ),
        ],
      

    ),

    );

  }
}

listTile({Text title, Icon leading, Text subtitle}) {
}