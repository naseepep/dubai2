



import 'package:flutter/material.dart';

class LeftSide extends StatelessWidget {
  const LeftSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 6,
      child: ClipRRect(
        child: Container(
           //color: Color(0xff292929),
      
          decoration: BoxDecoration(
            
             image: DecorationImage(
              opacity: 3.0,
              alignment: Alignment.center,
           image: AssetImage('Assets/images/hi.webp'),
            fit: BoxFit.fill,
         )
         ),
          child: Container(
            margin: EdgeInsets.fromLTRB(100, 50, 0, 30),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: 120,
                        //child: Image.asset(
                         //   'Assets/images/cyan_backgd.jpg')
                         )
                  ],
                ),
                SizedBox(height: 200),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}