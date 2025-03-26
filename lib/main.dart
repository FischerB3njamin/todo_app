import 'package:flutter/material.dart';
import 'package:todo_app/features/auth/views/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen());
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

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
                  Text(
                    'Hello',
                    style: TextTheme.of(context)
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
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

class NewCategoryScreen extends StatefulWidget {
  const NewCategoryScreen({super.key});

  @override
  State<NewCategoryScreen> createState() => _NewCategoryScreenState();
}

class _NewCategoryScreenState extends State<NewCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      color: const Color.fromARGB(255, 240, 238, 231),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Text("New category"),
          TextField(
            decoration: InputDecoration(labelText: "Category name"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 16,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Center(
                  child: Text("cancel"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: Text("next"),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class Category {
  String title;
  Color color;
  Category({required this.title, required this.color});
}
