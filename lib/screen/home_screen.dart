import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book_designing_ui/constants/color_constant.dart';
import 'package:flutter_book_designing_ui/models/newbook_model.dart';
import 'package:flutter_book_designing_ui/models/popularbook_model.dart';
import 'package:flutter_book_designing_ui/screen/selected_book_screen.dart';
import 'package:flutter_book_designing_ui/widgets/custom_tab_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi Tamim',
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kGreyColor,
                      ),
                    ),
                    Text(
                      'Discover Letest Book',
                      style: GoogleFonts.openSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 39,
                margin: EdgeInsets.only(left: 25, right: 25, top: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kLightGreyColor,
                ),
                child: Stack(
                  children: [
                    TextField(
                      maxLengthEnforced: true,
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 19, right: 50, bottom: 8),
                        border: InputBorder.none,
                        hintText: 'Search Book...',
                        hintStyle: GoogleFonts.openSans(
                          fontSize: 12,
                          color: kBlackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child:
                          SvgPicture.asset('assets/svg/background_search.svg'),
                    ),
                    Positioned(
                      top: 8,
                      right: 9,
                      child: SvgPicture.asset(
                          'assets/icons/icon_search_white.svg'),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25,
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(left: 25),
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    indicatorPadding: EdgeInsets.all(0),
                    isScrollable: true,
                    labelColor: kBlackColor,
                    unselectedLabelColor: kGreyColor,
                    labelStyle: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    indicator: RoundedRectangleTabIndicator(
                      weight: 2,
                      width: 10,
                      color: kBlackColor,
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          child: Text('New'),
                          margin: EdgeInsets.only(right: 23),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text('Trending'),
                          margin: EdgeInsets.only(right: 23),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Text('Best Seller'),
                          margin: EdgeInsets.only(right: 23),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 21),
                height: 210,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 25, right: 6),
                  itemCount: newbooks.length,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(

                      child: Container(
                        margin: EdgeInsets.only(right: 19),
                        height: 210,
                        width: 153,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kMainColor,
                          image: DecorationImage(
                            image: AssetImage(newbooks[index].image),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
                child: Text(
                  'Popular',
                  style: GoogleFonts.openSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: kBlackColor,
                  ),
                ),
              ),
              ListView.builder(
                  padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: populars.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectedBookScreen(
                              popularBookModel: populars[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 19),
                        height: 81,
                        width: MediaQuery.of(context).size.width - 50,
                        color: kBackgroundColor,
                        child: Row(
                          children: [
                            Container(
                              height: 81,
                              width: 62,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: AssetImage(populars[index].image)),
                                  color: kMainColor),
                            ),
                            SizedBox(
                              width: 21,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  populars[index].title,
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: kBlackColor),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  populars[index].author,
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: kGreyColor),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '\$' + populars[index].price,
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: kBlackColor),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
