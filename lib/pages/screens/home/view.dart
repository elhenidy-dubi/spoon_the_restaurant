part of'view_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final appBar = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: AppColors.mainColorGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainColorGrey,
        title: CustomTextField(
          height: 30,
          width: mediaQuery.width * .25,
          iconWidget: const Icon(
            Icons.search,
            color: AppColors.primaryColorBrown,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset('assets/images/spoon-logo-01.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(
              'assets/images/Menu icon.png',
              height: 27,
              width: 30,
            ),
          ),
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = HomeCubit.get(context);
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              controller.selectList==0?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mediaQuery.height *.7,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                       physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                          return Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              SizedBox(
                                width: mediaQuery.width,
                                height: mediaQuery.height*.7,
                                child: Card(
                                  color: Colors.white,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 15),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    width: mediaQuery.width * .8,
                                    height: 200,
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  controller.favouriteMeal(index);
                                                },
                                                child: Icon(
                                                  controller.selectFavouriteMeal[index] ==
                                                      false
                                                      ? Icons.favorite_border
                                                      : Icons.favorite,
                                                  color: const Color.fromRGBO(
                                                      235, 76, 40, 1),
                                                )),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: CustomText(
                                                width: mediaQuery.width*.5,
                                                text: controller.mealNamesList[index],
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const CustomText(
                                                  text: '\$ 24.00',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: Color.fromRGBO(235, 114, 44, 1)
                                                  ,
                                                  textAlign: TextAlign.center,
                                                ),
                                                Container(
                                                  color: const Color.fromRGBO(232, 222, 193, 1),
                                                  padding: EdgeInsets.all(3),
                                                  height: 20,
                                                  child:  const CustomText(
                                                    text: '10% Regular Discount',
                                                    alignment: Alignment.center,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10,
                                                    color: Color.fromRGBO(145, 139, 119, 1)
                                                    ,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            ),
                                            CustomButton(
                                              width: mediaQuery.width*.6,
                                              height: 50,
                                              borderRadiusObject: BorderRadius.circular(20),
                                              background: AppColors.mainColorGreen,
                                              text: 'ADD TO PLATE',
                                            )
                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              Image.asset(
                                controller.mealImages[index],
                                height: mediaQuery.height*.2,
                              ),
                            ],
                          );

                    },),
                  ),
                ],
              ):
              BuildCategoriesView(mediaQuery: mediaQuery, controller: controller),

              Container(
                width: mediaQuery.width,
                height: 100,
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(
                      width: mediaQuery.width * .6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CustomText(
                            text: 'Change view',
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.typeViewList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          controller.changeContainerColor(index);
                                        },
                                        child: Image.asset(
                                          controller.typeViewList[index],
                                          height: 25,
                                          width: 25,
                                        )),
                                    SizedBox(
                                      width: mediaQuery.width * .03,
                                    )
                                    //SizedBox(width: 5,)
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: mediaQuery.width * .3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CustomText(
                            text: 'Filter Food',
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          Image.asset(
                            'assets/images/Filter-icon.png',
                            height: 25,
                            width: 25,
                          ),
                        ],
                      ),
                    )

                    //
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


