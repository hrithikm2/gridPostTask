import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gridPost/pages/components/loading_overlay.dart';
import 'package:gridPost/pages/grid/grid_page.dart';

import 'components/posts_list_item.dart';
import 'posts_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GridPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding : EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.red)),
                  width: double.infinity,
                  child: Center(child: 'Tap here to switch to GridView'.text.xl2.red600.makeCentered())
                  ),
              )
              ),
            Flexible(
              child: GetBuilder<PostsController>(
                builder: (controller) {
                  return LoadingOverlay(
                    isLoading: controller.isLoading,
                    child: ListView.builder(
                      itemCount: controller.postsList.length,
                      itemBuilder: (context, index) => PostsListItem(
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
