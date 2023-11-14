import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableContainerIcon extends StatelessWidget {
  final IconData iconData;
  final double height;
  final double width;
  final VoidCallback onTap;
  const ReusableContainerIcon({super.key,required this.iconData, required this.height, required this.width, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height:height ,width: width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey,width: 0.7)),
        child: Center(child: Icon(iconData,color: Colors.grey,)),
      ),
    );
  }
}

class ReusableContainerText extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final VoidCallback onTap;
  const ReusableContainerText({super.key,required this.title, required this.height, required this.width, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,width: width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey,width: 0.7)),
        child: Center(child: Text(title, style: const TextStyle(fontSize:17,color: Colors.grey,fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
