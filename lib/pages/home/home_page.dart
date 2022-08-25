import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../views/category_view.dart';
import 'home_provider.dart';

class HomePage extends StatelessWidget {
  static const id = "/home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            leadingWidth: 70,
            leading:  const CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),


            ),
            centerTitle: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Good morning", style: TextStyle(color: Colors.grey, fontSize: 18),),
                Text("Andrew Ainsley"),
              ],
            ),
            actions: const [
              Icon(CupertinoIcons.heart),
              SizedBox(width: 10,),
              Icon(CupertinoIcons.bell),
              SizedBox(width: 10,),
            ],
          bottom: PreferredSize(preferredSize: const Size.fromHeight(60),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10)
            ),
            child: const TextField(

              decoration: InputDecoration(
                hintText: "Search",
                icon: Icon(Icons.search),

                border: InputBorder.none
              ),
            ),
          ),
            
          ),
          ),
          body: ChangeNotifierProvider(
              create: (context) => HomeProvider(),
              builder: (context, widget) {
                var homeProvider = Provider.of<HomeProvider>(context, listen: true);
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: 250,
                          width: double.infinity,
                          //sale view
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text("Special offer", style: const TextStyle(fontWeight: FontWeight.bold),),
                                  GestureDetector(
                                    onTap:()=> homeProvider.openProductsPage(context: context),
                                      child: const Text("See all", style: TextStyle(fontWeight: FontWeight.bold),)),

                                ],
                              ),
                              const SizedBox(height: 10,),
                              
                              Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.red[700],
                                  borderRadius: BorderRadius.circular(20),

                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Expanded(
                                        flex:1,child: SizedBox.shrink()),
                                    Expanded(
                                      flex: 5,
                                        child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:  [
                                        const Text("25%", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 55),),
                                        const Text("Today`s Special!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                                        Text("Get discount for every order, only valid for today", style: TextStyle(color: Colors.white.withOpacity(.7), fontWeight: FontWeight.normal, fontSize: 14),),
                                      ],
                                    )),
                                    Expanded(
                                        flex: 5,
                                        child: Image.network("https://sneakerbardetroit.com/wp-content/uploads/2016/08/air-jordan-1-swooshless-patent-sample.png", fit: BoxFit.contain,)),
                                  ],
                                ),
                                //child: ,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                        itemCount: homeProvider.categories.length,
                          itemBuilder: (context, index){
                            return GestureDetector(
                                onTap: ()=> homeProvider.onButtonTap(index, context),
                                child: homeProvider.currentPage == index ? AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.black
                                    ),
                                    child: Center(child: Text(homeProvider.categories[index].name, style: const TextStyle(color: Colors.white, fontSize: 16),))):
                                AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    margin: const EdgeInsets.symmetric(horizontal: 5),
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white
                                    ),
                                    child: Center(child: Text(homeProvider.categories[index].name, style: const TextStyle(color: Colors.black, fontSize: 20),)))
                            );
                          },),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/1.5,
                        child: PageView.builder(
                          onPageChanged: homeProvider.onPageChanged,
                          controller: homeProvider.pageController,
                          itemBuilder: (BuildContext context, int index) {
                            return CategoryView(category: homeProvider.categories[index],);
                          },

                        ),
                      ),

                    ],
                  ),
                );
              }
          ),


          // ListView.builder(
          //   padding: const EdgeInsets.all(15),
          //   itemCount: homeProvider.categories.length,
          //   shrinkWrap: true,
          //   itemBuilder: (context, index) {
          //     return CategoryView(category: homeProvider.categories[index]);
          //   },
          // ),
        );

  }
}
