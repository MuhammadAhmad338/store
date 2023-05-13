import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/helperServices.dart';
import 'brandBottomSheetCon.dart';
import 'customButton.dart';

void customShowBottomSheet(BuildContext context) {

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.white54,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.72,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
               topLeft: Radius.circular(12),
              topRight: Radius.circular(12)
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Filter",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text("Gender",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  CustomButton(
                    text: 'Men',
                  ),
                  CustomButton(
                    text: 'Women',
                  ),
                  CustomButton(
                    text: 'Kids',
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const Text("Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  CustomButton(
                    text: 'Shoes',
                  ),
                  CustomButton(
                    text: 'Apparels',
                  ),
                  CustomButton(
                    text: 'Accessories',
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text("Price",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              Consumer<HelperServices>(builder: (_, provider, __) {
                return Slider(
                    value: provider.value,
                    min: 0.0,
                    max: 100.0,
                    activeColor: Colors.black,
                    onChanged: (newValue) {
                      provider.sliderState(newValue);
                    });
              }),
              const Text("Brand",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BrandContainer(
                    image: 'assets/images/adidas.png',
                  ),
                  BrandContainer(
                    image: 'assets/images/jordan.png',
                  ),
                  BrandContainer(
                    image: 'assets/images/nike.png',
                  ),
                  BrandContainer(
                    image: 'assets/images/gucci.png',
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        );
      });
}
