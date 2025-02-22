import 'package:demo_app/utils/app_bar.dart';
import 'package:demo_app/utils/app_file_imports.dart';
import 'package:flutter/material.dart';

class HackerNewsScreen extends StatelessWidget {
  const HackerNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return AppScaffold(
      appbar: Appbar(
        title: 'Siya Tech Machine Test',
        automaticallyImplyLeading: false,
      ),
      body: newsProvider.isLoading
          ? Center(child: CircularProgressIndicator(
        color: AppColors.themeColor,
      ))
          : newsProvider.hasError
              ? Center(
                  child: Text(
                  'Failed to load stories.',
                  style: TextStyle(
                    color: AppColors.colorBlack,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ))
              : Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(
                        top: 10,
                        right: 15,
                      ),
                      child: Text(
                        'Total News (${newsProvider.stories.length})',
                        style: TextStyle(
                          color: AppColors.colorBlack,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: ListView.builder(
                          itemCount: newsProvider.stories.length,
                          padding: EdgeInsets.zero,
                          physics: AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final story = newsProvider.stories[index];
                            return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: AppColors.colorWhite,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                border: Border.all(
                                  color: AppColors.color6C6B6B,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: AppColors.themeColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.newspaper,
                                      size: 25,
                                      color: AppColors.colorWhite,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 7,
                                          ),
                                          child: Text(
                                            story.title,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.colorBlack,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 7,
                                          ),
                                          child: Text(
                                            '⭐ ${story.score} | 📝 ${story.by} | 💬 ${story.descendants ?? 0} comments',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.colorBlack,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 7,
                                          ),
                                          child: Text(
                                            AppUtils().formatTimestamp(
                                              story.time,
                                            ),
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: AppColors.colorBlack,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                            top: 7,
                                          ),
                                          child: GestureDetector(
                                            behavior:
                                                HitTestBehavior.translucent,
                                            onTap: () => newsProvider.openUrl(
                                              story.url ?? '',
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Open in detail',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: AppColors.themeColor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_sharp,
                                                  size: 15,
                                                  color: AppColors.themeColor,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
