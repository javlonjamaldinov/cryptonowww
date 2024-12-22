import 'package:cryptonow/src/prizentetion/ui/choosecryptoCode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseCrypto extends StatefulWidget {
  const ChooseCrypto({super.key});

  @override
  State<ChooseCrypto> createState() => _ChooseCryptoState();
}

class _ChooseCryptoState extends State<ChooseCrypto> {
  int? selectedIndex;
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff04091D),
      appBar: AppBar(
        backgroundColor: const Color(0xff04091D),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: const Text(
          'Choose Crypto',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0.sp),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff1C2033),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                  onChanged: (value) => setState(() => searchText = value),
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Code.length,
              itemBuilder: (_, i) {
                if (searchText.isNotEmpty &&
                    !Code[i]
                        .text
                        .toLowerCase()
                        .contains(searchText.toLowerCase())) {
                  return const SizedBox();
                }
                bool isSelected = selectedIndex == i;
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0.sp, vertical: 1.h),
                  child: GestureDetector(
                    onTap: () => setState(() => selectedIndex = i),
                    child: Container(
                      height: 8.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff0A1336),
                        borderRadius: BorderRadius.circular(40),
                        border: isSelected
                            ? Border.all(color: Colors.blue, width: 2)
                            : null,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Row(
                          children: [
                            SvgPicture.asset(Code[i].image),
                            SizedBox(width: 3.w),
                            Text(
                              Code[i].text,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            if (isSelected)
                              const Icon(Icons.check, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
