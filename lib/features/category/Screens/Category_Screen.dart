import 'package:flutter/material.dart';
import 'package:new_project_sat26/features/Product/Screen/product.dart';
import 'package:new_project_sat26/features/category/data/category_repo.dart';
import 'package:new_project_sat26/features/category/models/category_item_model.dart';

class CategoryScreen extends StatefulWidget {
  final String Categoryname;
  final int id;
  const CategoryScreen({Key? key, required this.Categoryname, required this.id}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
dynamic category ;
  void initState(){
    super.initState();
    category=  CategoryRepo().getCategoryDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Categoryname),
      ),
      body: FutureBuilder(
        future: category,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Text('There is an error, please try again!');
          }
          if (snapshot.hasData) {
            final ListOfCatgories = (snapshot.data as Map<String,dynamic>)['data']['data'];
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (_, index) {
                if (index < ListOfCatgories.length) {
                  final Product = CategoryItemModel.fromJson(ListOfCatgories[index]);
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductScreen(productId:Product.id)),
                      );

                    },
                    child: Container(

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            Product.image,
                            height: 100,
                            width: 100,
                          ),
                          Text(Product.name),
                        ],
                      ),
                    ),
                  );
                  // Rest of the code
                } else {
                  return Container(); // or handle the out-of-range case accordingly
                }

              },
            );
          }
          // Default return statement
          return Container();
        },
      ),
    );
  }
}