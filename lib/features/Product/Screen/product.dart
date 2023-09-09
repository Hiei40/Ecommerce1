import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project_sat26/features/Product/Cubit/product_cubit.dart';

class ProductScreen extends StatefulWidget {
  final int productId;
   ProductScreen({super.key,  required this.productId,});
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool? videoCall;
  @override
  void initState() {
    videoCall=true;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
 context.read<ProductCubit>().getProduct(widget.productId);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ProductScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('product'),
      ),
      body: ListView(
        children: [
          Text(
            'Product Title',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff223263),
            ),
          ),
        ],
      ),
    );
  }
}
