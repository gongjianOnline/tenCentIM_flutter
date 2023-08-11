import 'package:flutter/material.dart';

class CircleData {
  /**文本模板 */
  static textComponent({context="允公允能,日新月异"}){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            alignment: Alignment.centerLeft,
            child: Text(context),
          )
        )
      ],
    );
  }
  /* 图片模板 */
  static ImageComponent({imgUrl=""}){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
            )
          )
        ],
      ),
    );
  }


}