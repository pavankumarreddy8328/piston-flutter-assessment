import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(Icons.wifi_off_rounded,
        size: 48,
        color: Colors.grey,
        ),
    
        SizedBox(
          height: 20,
        ),
    
        Center(
          child: Text("Oops!",
          style: TextStyle(
            fontSize: 32,
            color: Colors.grey
          ),),
        ),
    
        SizedBox(
          height: 12,
        ),
        Center(
          child: Text("No Internet Connection",
          
          style: TextStyle(
            fontSize: 24,
             color: Colors.grey
          ),),
        )
      ],
    );
  }
}