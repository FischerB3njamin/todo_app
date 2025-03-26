import 'package:flutter/material.dart';
import 'package:todo_app/features/categories/models/category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 1,
                color: category.color.withAlpha(58),
                blurStyle: BlurStyle.outer,
                offset: Offset(-1, -1))
          ],
          color: const Color.fromARGB(255, 244, 243, 243),
          border: Border.all(color: category.color, width: 4),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.home,
                      color: category.color,
                      size: 40,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 240,
                      height: 50,
                      child: Text(
                        // softWrap: true, // Allow text to wrap
                        overflow: TextOverflow.clip,
                        category.title,
                        style: TextTheme.of(context)
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text("Tasks"),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          height: 10,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 1),
                          height: 8,
                          width: 150,
                          decoration: BoxDecoration(
                            color: category.color,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 8),
                    Text("50%")
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
