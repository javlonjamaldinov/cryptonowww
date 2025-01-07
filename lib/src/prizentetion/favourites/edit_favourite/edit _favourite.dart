import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'edit_favourite_code.dart';

class EditFavourite extends StatefulWidget {
  const EditFavourite({
    super.key,
    required this.favourite,
  });

  final Map<String, String> favourite;

  @override
  State<EditFavourite> createState() => _EditFavouriteState();
}

class _EditFavouriteState extends State<EditFavourite> {
  late final TextEditingController nameController;
  late final TextEditingController linkController;
  bool isCopied = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.favourite['name']);
    linkController = TextEditingController(text: widget.favourite['link']);

    nameController.addListener(_onTextChanged);
    linkController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    nameController.dispose();
    linkController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    setState(() {
      isCopied = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isCopied = false;
      });
    });
  }

  void _clearFields() {
    nameController.clear();
    linkController.clear();
    setState(() {
      isCopied = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: const Color(0xff04091D),
            appBar: _buildAppBar(),
            body: Column(
              children: [
                _buildTabBar(),
                Expanded(
                  child: TabBarView(
                    children: [
                      EditFavouriteCode(
                        nameController: nameController,
                        linkController: linkController,
                        isCopied: isCopied,
                        copyToClipboard: copyToClipboard,
                      ),
                      EditFavouriteCode(
                        nameController: nameController,
                        linkController: linkController,
                        isCopied: isCopied,
                        copyToClipboard: copyToClipboard,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: GestureDetector(
            onTap: _clearFields,
            child: SvgPicture.asset('assets/svg/svg58.svg'),
          ),
        ),
      ],
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xff04091D),
      title: Text(
        'Edit Favourite',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.white,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(),
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Container(
        height: 8.h,
        decoration: BoxDecoration(
          color: const Color(0xff121829),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: TabBar(
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              color: const Color(0xff4664FF),
              borderRadius: BorderRadius.circular(30),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              _buildTab('Exchanger', 'assets/svg/svg56.svg'),
              _buildTab('User', 'assets/svg/svg55.svg'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, String iconPath) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath),
          SizedBox(width: 2.w),
          Text(title, style: TextStyle(fontSize: 14.sp)),
        ],
      ),
    );
  }
}
