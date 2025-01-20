import 'package:demo_app/utils/app_file_imports.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backGroundColor: AppColors.colorF9F9F9,
      appbar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.colorWhite,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'The\nOrdinary',
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 18,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Consumer<HomeProvider>(builder: (context, provider, __) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Browse By Categories',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AnimationLimiter(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: provider.itemList.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                        crossAxisCount: 2,
                        height: 300,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        var item = provider.itemList[index];
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          columnCount: 4,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: AppNetworkImage(
                                          image: item.image,
                                          fit: BoxFit.cover,
                                          errorWidget: Image.asset(
                                            'assets/images/img_no_image_available.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: AppColors.colorWhite,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '\$${item.price}',
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 13),
                                                ),
                                                Spacer(),
                                                StarRating(
                                                  rating: item.rating,
                                                  color: AppColors.colorYellow,
                                                  borderColor:
                                                      AppColors.colorYellow,
                                                  size: 15,
                                                  allowHalfRating: false,
                                                  onRatingChanged: (rating) {},
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Text(
                                                item.productName,
                                                style: TextStyle(
                                                    color: AppColors.textColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Text(
                                                item.productDescription,
                                                style: TextStyle(
                                                    color:
                                                        AppColors.color6C6B6B,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 11),
                                              ),
                                            ),
                                            AppButton(
                                              padding: EdgeInsets.only(top: 10),
                                              btnHeight: 25,
                                              textSize: 11,
                                              onPressed: () {},
                                              name: 'Add To Cart'.toUpperCase(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
