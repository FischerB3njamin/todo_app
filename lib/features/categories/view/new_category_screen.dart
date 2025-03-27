import 'package:flutter/material.dart';

class NewCategoryScreen extends StatefulWidget {
  const NewCategoryScreen({super.key});

  @override
  State<NewCategoryScreen> createState() => _NewCategoryScreenState();
}

class _NewCategoryScreenState extends State<NewCategoryScreen> {
  int active = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      color: const Color.fromARGB(255, 240, 238, 231),
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: pageController,
        onPageChanged: (value) => setState(() => active = value),
        children: [
          NewCategoryTitle(index: active, controller: pageController),
          NewCategoryTitle(index: active, controller: pageController),
          NewCategoryTitle(index: active, controller: pageController),
        ],
      ),
    );
  }
}

class NewCategoryTitle extends StatelessWidget {
  final int index;
  final PageController controller;

  const NewCategoryTitle({
    super.key,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              onPressed: () {
                if (index > 0) {
                  controller.animateToPage(index - 1,
                      duration: Duration(milliseconds: 600),
                      curve: Curves.fastOutSlowIn);
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Center(
                child: Text("cancel"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (index + 1 < 3) {
                    controller.animateToPage(index + 1,
                        duration: Duration(milliseconds: 600),
                        curve: Curves.fastOutSlowIn);
                  } else if (index == 2) {
                    // create Category
                    Navigator.of(context).pop();
                  }
                },
                child: Center(
                  child: Text("next"),
                )),
          ],
        )
      ],
    );
  }
}
