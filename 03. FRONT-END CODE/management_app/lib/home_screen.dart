
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:management_app/app_colors.dart';
import 'package:management_app/detail_table.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   final tableSelected = [0, 7, 9, 12];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(
                height: 70.h,
              ),
              const Center(
                child: Text(
                  'Trang chủ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF3D5480),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0.07,
                  ),
                ),
              ),
              SizedBox(
                height: 19.h,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/images/ic_bell.svg'),
                  Text(
                    'Thông Báo',
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      color: const Color(0xFF3D5480),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 101.06.w / 85.h,
                  ),
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    final isSelected = tableSelected.contains(index);
                    return Container(
                      height: 85.h,
                      width: 101.06.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.w),
                          border: Border.all(
                            color: AppColors.green,
                          ),
                          color: isSelected
                              ? AppColors.green
                              : Colors.transparent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Bàn ${index + 1}',
                            style: GoogleFonts.inter(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  DetailTableScreen(tableNumber: index+1,),
                            )),
                            child: Container(
                              height: 32.h,
                              margin: EdgeInsets.symmetric(horizontal: 6.w),
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFF1EDEA)
                                    : AppColors.green,
                                borderRadius: BorderRadius.circular(19.w),
                              ),
                              child: Center(
                                child: Text(
                                  isSelected ? 'Đang chọn' : 'Chọn',
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    color: isSelected
                                        ? const Color(0xFF3E5481)
                                        : Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    
       bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/ic_home.svg'
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/ic_menu.svg'
            ),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/ic_qrcode.svg'
            ),
            label: 'Mã QR',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/ic_doanhthu.svg'
            ),
            label: 'Doanh thu',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/ic_profile.svg'
            ),
            label: 'Tài khoản',
          ),
        ],
      ),
    );
  }
}
