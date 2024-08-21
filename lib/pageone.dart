import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/home_controller.dart';
import 'package:provider_app/pagetwo.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
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
        child: Consumer<HomeController>(
          builder: (_, model, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Page one: ${context.read<HomeController>().number}"),
                  Consumer<HomeController>(
                      builder: (context, userStore, child) {
                    return Text("${userStore.number}");
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      Get.to(
                        PageTwo(),
                      ),
                    },
                    child: const Text("Go to page two"),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
