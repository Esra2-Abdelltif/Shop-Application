import 'package:flutter/material.dart';
import 'package:shop_project/modules/login_screen/login_screen.dart';
import 'package:shop_project/shared/Constans/constans.dart';
import 'package:shop_project/shared/Styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class BoardingModel{
  final String image;
  final String title;
  final String body;

  BoardingModel({@required this.image,@required this.title,@required this.body});
}
class OnBoardinScreen extends StatefulWidget {
  @override
  State<OnBoardinScreen> createState() => _OnBoardinScreenState();
}

class _OnBoardinScreenState extends State<OnBoardinScreen> {
  var boardController =PageController();

  List<BoardingModel> boarding =[
    BoardingModel(image:'assets/images/onboarding_1.png' , title: 'Screen Title1', body: 'Screen body1'),
    BoardingModel(image:'assets/images/onboarding_1.png' , title: 'Screen Title2', body: 'Screen body2'),
    BoardingModel(image:'assets/images/onboarding_1.png' , title: 'Screen Title3', body: 'Screen body1')
  ];
  bool isLast=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(onPressed:(){
            NavigateAndFinsh(context: context,router: LoginScreen());
          } , child:Text('Skip',))
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
          Expanded(
            child: PageView.builder(
              controller: boardController,
             onPageChanged: (int index){
                if(index == boarding.length-1){
                  setState(() {
                    isLast=true;
                  });
                  print('last');
                }
                else {
                  setState(() {
                    isLast=false;
                  });
                  print('not last');

                }
             },
             // physics: BouncingScrollPhysics(), //بتشيل اللون الي بيظهر في جنب لما بوصل للنهايه
              itemBuilder: ((context, index) => BuildBoardingItem(boarding[index])),
              itemCount: boarding.length,
            ),
          ),
            const SizedBox(height: 40,),
            Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: SmoothPageIndicator(
                        controller: boardController,
                        count: boarding.length,
                        effect:  const JumpingDotEffect(
                          activeDotColor: defultColor,
                          dotHeight: 16,
                          dotWidth: 16,
                          jumpScale: .7,
                          verticalOffset: 15,

                        ),
                    ),
                  ),
                  const Spacer(),
                  FloatingActionButton(onPressed: (){
                    if(isLast){
                      NavigateAndFinsh(router: LoginScreen(),context: context);
                    }
                    else{
                      boardController.nextPage(duration: const Duration(milliseconds: 750), curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },child: const Icon(Icons.arrow_forward_ios),)


                ]
            ),
        ],),
      )
    );
  }

  Widget BuildBoardingItem(BoardingModel model)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Image(image: AssetImage('${model.image}'))),
      const SizedBox(height: 10,),
      Center(child: Text('${model.title}',style: const TextStyle(fontSize: 24))),
      const SizedBox(height: 10,),
      Center(child: Text('${model.body}',style: const TextStyle(fontSize: 14))),
      const SizedBox(height: 10,),
    ],
  );
}