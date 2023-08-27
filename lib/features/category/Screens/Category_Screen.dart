import 'package:flutter/material.dart';
import 'package:new_project_sat26/features/category/data/category_repo.dart';

class CategoryScreen extends StatefulWidget {
  final String Categoryname;
  final int id;
  const CategoryScreen({Key? key, required this.Categoryname, required this.id}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Categoryname),
      ),
      body: FutureBuilder(
        future: CategoryRepo().getCategoryDetails(widget.id),
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
            final ListOfCatgories = snapshot.data['data']['data'];
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (_, index) {
                final data=ListOfCatgories[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        data['image'],
                        height: 100,
                        width: 100,
                      ),
                      Text(data['name']),
                    ],
                  ),
                );
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