part of'home_widgets_imports.dart';

class BuildCategoriesView extends StatelessWidget {
  const BuildCategoriesView({
    Key? key,
    required this.mediaQuery,
    required this.controller,
  }) : super(key: key);

  final Size mediaQuery;
  final HomeCubit controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Wrap(
          direction: Axis.horizontal,
          children: List.generate(6, (index) {
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 15),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                width: mediaQuery.width * 0.4,
                height: 200,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
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
                    Image.asset(
                      controller.mealImages[index],
                      height: 120,
                    ),
                    CustomText(
                      text: controller.mealNamesList[index],
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}