import 'package:flutter/material.dart';
import 'package:p2_todo/home/my_theme.dart';

class ItemTaskListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      decoration: BoxDecoration(
          color: MyThemeData.whiteColor,
        borderRadius: BorderRadius.circular(18)
      ),
      child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(

            decoration: BoxDecoration(
                color: MyThemeData.primaryLight,
                borderRadius: BorderRadius.circular(40)
            ),
            height: 80,
            width: 5,
          ),
          Column(
            children: [
              Text('Task title',style: Theme.of(context).primaryTextTheme.headline2),
              Text('Description')
            ],
          ),
          InkWell(
            onTap: (){},
            child: Container(

                padding: EdgeInsets.symmetric(vertical: 13,horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow:[BoxShadow(
                    color: MyThemeData.primaryLight.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(3, 3),
                  ),
                  ],
                ),
                child: Icon(Icons.check,color: MyThemeData.whiteColor,size: 30,)
            ),
          ),
        ],
      ),
    );
  }
}
