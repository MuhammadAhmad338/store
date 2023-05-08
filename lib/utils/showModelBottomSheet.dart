import 'package:flutter/material.dart';
import 'customButton.dart';

void  customShowBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
          color: Colors.yellow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Filter", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
              )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              const Text("Gender", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  const [
                  CustomButton(text: 'Men',),
                  CustomButton(text: 'Women',),
                  CustomButton(text: 'Kids',)
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
              const Text("Category", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  const [
                  CustomButton(text: 'Shoes',),
                  CustomButton(text: 'Apparels',),
                  CustomButton(text: 'Accessories',)
                ],
              )
            ],
          )
      );
    }
  );
}