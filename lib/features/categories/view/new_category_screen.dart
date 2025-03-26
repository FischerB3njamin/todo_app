import 'package:flutter/material.dart';

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
