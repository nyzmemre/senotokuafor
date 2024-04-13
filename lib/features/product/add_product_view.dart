import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kartal/kartal.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:senotokuafor/features/product/product_model.dart';
import 'package:senotokuafor/product/utility/constants/text_constant.dart';
import 'package:senotokuafor/product/widgets/custom_text_form_field.dart';
import 'package:senotokuafor/product/widgets/my_scaffold.dart';

class AddProductView extends StatelessWidget {
  AddProductView({Key? key}) : super(key: key);
  final _key=GlobalKey<FormState>();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productNumController = TextEditingController();
  TextEditingController productDetailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        appBar: AppBar(
          title: const Text(TextConstant.addProduct),
        ),
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            context.sized.emptySizedHeightBoxNormal,
                row(
                  context: context,
                  controller: productCodeController,
                  title: TextConstant.productCode,
                  labelText: TextConstant.enterProductCode,
                ),
                context.sized.emptySizedHeightBoxLow,
                row(
                  context: context,
                  controller: productNameController,
                  title: TextConstant.productName,
                  labelText: TextConstant.enterName,
                ),
                context.sized.emptySizedHeightBoxLow,
                row(
                  context: context,
                  controller: productNumController,
                  title: TextConstant.numOfStock,
                  labelText: TextConstant.enterNum,
                  keyboardType: TextInputType.number
                ),
                context.sized.emptySizedHeightBoxLow,
                row(
                  context: context,
                  controller: productDetailController,
                  title: TextConstant.productDetail,
                  labelText: TextConstant.enterDetail,
                ),
                context.sized.emptySizedHeightBoxNormal,
                ElevatedButton(onPressed: () async {
                  if(_key.currentState!=null){
                    if(_key.currentState!.validate()){
                        await Hive.box<ProductModel>(TextConstant.productBox).put(
                            productCodeController.text, ProductModel(
                            productID: productCodeController.text,
                            productName: productNameController.text,
                            productNum: int.parse(productNumController.text),
                            productDetail: productDetailController.text ?? '',
                            dateTime: DateTime.now()
                        ));
            
                        MotionToast.success(description: Text('Ürün eklendi')).show(context);
                        productCodeController.clear();
                        productNameController.clear();
                        productNumController.clear();
                        productDetailController.clear();
            
                    }else{
                      MotionToast.error(description: Text('Lütfen dikkat')).show(context);
                    }
                  }
            
            
                }, child: const Text(TextConstant.addProduct))
            
              ],
            ),
          ),
        ));
  }

  Row row({
    required BuildContext context,
    required TextEditingController controller,
    required String title,
    required String labelText,
    TextInputType? keyboardType
  }) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(title),
        context.sized.emptySizedWidthBoxNormal,
        SizedBox(
            width: 200,
            child: CustomTextFormField(
                controller: controller,
                keyboardType: keyboardType,
                labelText: '$title giriniz'))
      ],
    );
  }
}
