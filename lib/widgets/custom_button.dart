import 'package:flutter/material.dart';
import '../../app/app_colors.dart';


class CustomButton extends StatelessWidget {
  String? text ;
  Function()? onPressed ;
  double? width ;
  double? height ;
  double? textSize ;
  BoxDecoration? decoration;
  Color? textColor ;
  bool? loading ;
  Color? background ;
  Border? border ;
  Widget? icon ;
  double? borderRadius;
  BorderRadius? borderRadiusObject ;
  CustomButton({Key? key, this.borderRadius,this.borderRadiusObject,this.textSize = 16,this.text, this.icon, this.background , this.border,this.onPressed, this.width, this.height ,this.decoration ,this.textColor,this.loading =false }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return loading! ? const CircularProgressIndicator()
        :
    InkWell(
      onTap: onPressed,
      child: Container(
          width: width ?? MediaQuery.of(context).size.width-26 ,
          height: height ?? 56,
          decoration: decoration ?? BoxDecoration(
              color: background ?? AppColors.mainColorBlue,
              borderRadius:borderRadiusObject ??BorderRadius.circular(borderRadius ?? 7),
              border:  border
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon??Container(),
              icon!= null && (text?.isNotEmpty??false) ? const SizedBox(width: 6,) : const SizedBox(),
              Text(
                text??"" ,
                style: TextStyle(
                  color: textColor??Colors.white ,
                  fontSize: textSize??18 ,
                  fontFamily: "DIN-MEDIUM",
                  //fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )
      ),
    );
  }
}