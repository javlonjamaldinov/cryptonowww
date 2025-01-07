import 'package:cryptonow/src/prizentetion/favourites/edit_favourite/edit%20_favourite.dart';
import 'package:cryptonow/src/prizentetion/prizentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Map<String, String>> favourites = [];

  Future<void> _loadFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedFavourites = prefs.getString('favourites');
    if (savedFavourites != null) {
      setState(() {
        favourites = List<Map<String, String>>.from(
          (json.decode(savedFavourites) as List<dynamic>).map(
            (e) => Map<String, String>.from(e as Map),
          ),
        );
      });
    }
  }

  Future<void> _saveFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('favourites', json.encode(favourites));
  }

  @override
  void initState() {
    super.initState();
    _loadFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff04091D),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff04091D),
        title: Row(
          children: [
            Text(
              'Favourites',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            SvgPicture.asset('assets/svg/svg3.svg'),
          ],
        ),
      ),
      body: favourites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No favourites',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'Add new favourite info to fill up this screen',
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 20.sp),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 5.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff0A1336),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Row(
                          children: [
                            Text(
                              'Amount of favourites',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white54),
                            ),
                            const Spacer(),
                            Text(
                              favourites.length.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    ...favourites.asMap().entries.map(
                      (entry) {
                        final index = entry.key;
                        final favourite = entry.value;
                        String iconPath = favourite['type'] == 'User'
                            ? 'assets/svg/svg55.svg'
                            : 'assets/svg/svg56.svg';
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditFavourite(favourite: favourite),
                                  ),
                                );
                                if (result != null) {
                                  setState(() {
                                    favourites[index] =
                                        Map<String, String>.from(result);
                                  });
                                  _saveFavourites();
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(16.sp),
                                decoration: BoxDecoration(
                                  color: const Color(0xff0A1336),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(iconPath,
                                        width: 2.5.w, height: 2.5.h),
                                    SizedBox(width: 10.sp),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          favourite['name'] ?? '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          favourite['link'] ?? '',
                                          style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white54,
                                      size: 18.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 1.5.h),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.sp),
        child: GestureDetector(
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddFavourite(),
              ),
            );
            if (result != null) {
              setState(() {
                favourites.add(Map<String, String>.from(result));
              });
              _saveFavourites();
            }
          },
          child: Container(
            height: 7.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff4674FF),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Text(
                'Add favourite',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
