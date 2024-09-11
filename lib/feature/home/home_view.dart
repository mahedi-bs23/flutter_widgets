import 'package:flutter/material.dart';
import 'package:flutter_widget/app/app_view_model.dart';
import 'package:flutter_widget/feature/custom_button/custom_button_view.dart';
import 'package:flutter_widget/feature/home/home_view_model.dart';
import 'package:flutter_widget/models/widget_list_model.dart';
import 'package:flutter_widget/navigation/app_pages.dart';

class HomePage extends StatelessWidget {
  final AppViewModel appViewModel;

  const HomePage({required this.appViewModel});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = HomeViewModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Widgets',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<List<WidgetListModel>>(
        valueListenable: homeViewModel.pages,
        builder: (context, pages, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(10),
            itemCount: pages.length,
            itemBuilder: (context, index) {
              final pageItem = pages[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pageItem.page,
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.indigoAccent.shade200,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 1,  // How far the shadow spreads
                          blurRadius: 4,    // How blurry the shadow is
                          offset: const Offset(0, 2), // Position of the shadow (x, y)
                        )
                      ]
                  ),
                  child: Row(
                    children: [
                      Text(
                        pageItem.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding:
                        const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            //shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // Shadow color
                                spreadRadius: 0.5,  // How far the shadow spreads
                                blurRadius: 5,    // How blurry the shadow is
                                offset: const Offset(0, 0), // Position of the shadow (x, y)
                              )
                            ]
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.indigoAccent.shade200,
                          size: 18,

                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          );
        },
      ),
    );
  }
}
