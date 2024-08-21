import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/home_controller.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Consumer<HomeController>(builder: (context, userStore, child) {
          return Text("${context.read<HomeController>().number}");
        }),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider.value(
          value: homeController,
          child: Consumer<HomeController>(builder: (_, model, child) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Page two: ${model.number}"),
                ElevatedButton(
                  onPressed: () => {
                    context.read<HomeController>().increaseNumber(),
                  },
                  child: const Text("Increase"),
                ),
                ElevatedButton(
                  onPressed: () => {
                    context.read<HomeController>().reduceNumber(),
                  },
                  child: const Text("Decrease"),
                )
              ],
            ));
          })),
    );
  }
}
