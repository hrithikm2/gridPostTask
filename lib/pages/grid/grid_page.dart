import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gridPost/pages/components/loading_overlay.dart';
import 'package:gridPost/pages/posts/components/grid_list_item.dart';
import 'package:gridPost/pages/posts/posts_controller.dart';
import 'package:gridPost/pages/posts/posts_page.dart';
import 'package:velocity_x/velocity_x.dart';

class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid"),
      ),
      body: Container(
        child: Column(
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PostsPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      padding : EdgeInsets.all(15),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.red)),
                      width: double.infinity,
                      child: Center(child: 'Tap here to switch to PostView'.text.xl2.red600.makeCentered())
                  ),
                )
            ),
            Flexible(
              child: GetBuilder<PostsController>(
                builder: (controller) {
                  return LoadingOverlay(
                    isLoading: controller.isLoading,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                      mainAxisSpacing: MediaQuery.of(context).size.width *0.005,
                        crossAxisSpacing: MediaQuery.of(context).size.width *0.005
                      ),
                      itemCount: controller.postsList.length,
                      itemBuilder: (context, index) => GridListItem(
                        post: controller.postsList[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
