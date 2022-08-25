import 'package:flutter/material.dart';
import 'package:my_announcement/pages/intro_page/intro_provider.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatelessWidget {
  static const String id = 'intro_page';
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ChangeNotifierProvider(
          create: (context) => IntroProvider(),
          builder: (context, widget) {
            var introProvider = Provider.of<IntroProvider>(context, listen: false);
            return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                onPageChanged: introProvider.onPageChanged,
                controller: introProvider.pageController,
                children:  [
                  MakePage(title: 'We provide high quality products just for you', image: 'assets/images/ic_sneakers2.jpg', key: const PageStorageKey(0),),
                  MakePage(title: 'Your satisfaction is our number one priority', image: 'assets/images/ic_sneakers3.jpg', key: const PageStorageKey(1)),
                  MakePage(title: 'Let`s fulfill your fashion needs with Shoea right now!', image: 'assets/images/ic_sneakers4.jpg', key: const PageStorageKey(2)),
                ],
              ),
              Consumer<IntroProvider>(
                builder: (context, intro, child) {
                  return Container(
                    margin:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height/21.1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IntroIndicator(isActive: introProvider.currentPage == 0 ? true : false, isNext: introProvider.currentPage != 2 ? true : false,),
                            IntroIndicator(isActive: introProvider.currentPage == 1 ? true : false, isNext: introProvider.currentPage != 2 ? true : false,),
                            IntroIndicator(isActive: introProvider.currentPage == 2 ? true : false, isNext: introProvider.currentPage != 2 ? true : false,),
                          ],
                        ),
                        GestureDetector(
                          onTap: ()=>introProvider.onButtonTap(introProvider.currentPage, context),
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: introProvider.currentPage != 2 ? const Text("Next", style: TextStyle(color: Colors.white)):const Text("Done", style: TextStyle(color: Colors.white) ,),
                            ),
                          ),
                        )

                      ],
                    ),
                  );
                }
              ),

            ],
          );
        }
      ),
    );
  }



}

class MakePage extends StatelessWidget{
  String image;
  String title;
  MakePage({Key? key, required this.image, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height/2,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(image, fit: BoxFit.cover,),
        ),
        const SizedBox(height: 30,),
        Text(title, style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height/21.1, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
      ],
    );
  }
}


class IntroIndicator extends StatelessWidget {
  bool isActive;
  bool isNext;
  void Function()? onButtonTap;
  IntroIndicator({Key? key, required this.isActive, required this.isNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
