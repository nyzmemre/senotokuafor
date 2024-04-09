import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:senotokuafor/product/widgets/custom_text_form_field.dart';
import 'package:senotokuafor/product/widgets/my_scaffold.dart';


class AddProductView extends StatelessWidget {
   AddProductView({Key? key}) : super(key: key);
TextEditingController productCodeController=TextEditingController();
TextEditingController productNameController=TextEditingController();
TextEditingController productInfoMtearil=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: Column(
      children: [
        row(context: context, controller: productCodeController, title: 'Ürün Kodu', labelText: 'Kod Giriniz', ),
        context.sized.emptySizedHeightBoxLow,
        row(context: context, controller: productNameController, title: 'Ürün Adı', labelText: 'Ad Giriniz', ),
        context.sized.emptySizedHeightBoxLow,
        row(context: context, controller: productNameController, title: 'Stok Adedi', labelText: 'Adet Giriniz', )
      ],
    ));
  }

  Row row(
      {
     required   BuildContext context,
        required TextEditingController controller,
     required String title,
     required String labelText,
     }) {
    return Row(
        children: [
          Text(title),
context.sized.emptySizedWidthBoxNormal,
SizedBox(
  width: 200,
  child: CustomTextFormField(
      controller: controller,
      labelText: '$title giriniz'))          ],
      );
  }
}
