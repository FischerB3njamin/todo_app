import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/auth/data/login_controller.dart';
import 'package:todo_app/features/categories/models/category.dart';
import 'package:todo_app/features/categories/view/new_category_screen.dart';
import 'package:todo_app/features/categories/widgets/category_tile.dart';

class CategoryPage extends StatefulWidget {
  final LoginController loginController;
  final User user;
  const CategoryPage({
    super.key,
    required this.loginController,
    required this.user,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<Category> categories = [
    Category(
        title: 'Super AufgabenSuper AufgabenSuper AufgabenSuper Aufgaben',
        color: Colors.green),
    Category(title: 'Super ', color: Colors.blueAccent),
    Category(title: 'Super toll', color: Colors.deepPurple),
    Category(title: 'Super hervorragend', color: Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        color: const Color.fromARGB(255, 240, 238, 231),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 250,
                    child: Text(
                      'Hello ${widget.user.email} ',
                      style: TextTheme.of(context)
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                  IconButton(
                      onPressed: () => widget.loginController.logout(),
                      icon: Icon(Icons.logout)),
                ],
              ),
              Text(
                'You have 16 Tasks to complete!',
                style: TextTheme.of(context).bodyLarge,
              ),
              Divider(),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ReorderableListView(
                  proxyDecorator:
                      (Widget child, int index, Animation<double> animation) {
                    return Material(
                      color: Colors.transparent,
                      child: child,
                    );
                  },
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) newIndex--;
                      final item = categories.removeAt(oldIndex);
                      categories.insert(newIndex, item);
                    });
                  },
                  children: [
                    for (final category in categories)
                      CategoryTile(key: ValueKey(category), category: category),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => NewCategoryScreen());
                      },
                      child: Text('Add Category'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
