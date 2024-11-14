import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/views/category_view.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    super.key,
    required this.categoryList,
    required this.ImageList,
  });
  List<dynamic> categoryList;
  String ImageList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return  CategoryView(categoryName:categoryList[0] ,);
          }));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          height: 70,
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Image.asset(
                ImageList,
                width: 50,
                height: 40,
              ),
              const SizedBox(width: 4),
              Text(
                categoryList[0],
                style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(
                width: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
