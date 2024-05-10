import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:management_app/app_colors.dart';

class DetailTableScreen extends StatefulWidget {
  const DetailTableScreen({super.key, required this.tableNumber});

  final int tableNumber;

  @override
  State<DetailTableScreen> createState() => _DetailTableScreenState();
}

class _DetailTableScreenState extends State<DetailTableScreen> {
  final List<String> foodNames = ['Nước ép cà rốt','Sinh tố bơ','Cafe sữa Sài Gòn'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const BackButton(),
                        SizedBox(
                          width: 100.w,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            Text(
                              'Đà Nẵng',
                              style: GoogleFonts.inter(
                                fontSize: 18.sp,
                                color: AppColors.lightBlack,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 46.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Bàn ${widget.tableNumber}',
                            style: GoogleFonts.inter(
                              fontSize: 20.sp,
                              color: AppColors.lightBlack,
                              fontWeight: FontWeight.bold,
                            )),
                        Container(
                          width: 97.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(9.w),
                          ),
                          child: Center(
                            child: Text(
                              'Thêm món',
                              style: GoogleFonts.inter(
                                fontSize: 15.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Column(
                      children: List.generate(
                        3,
                        (index) => _buildItem(foodName: foodNames[index]),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tổng thành tiền',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          '84,000',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 18.h),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.green),
                  bottom: BorderSide(color: AppColors.green),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    // tạo 3 container nằm trong 3 flexible với flex:1 màu AppColors.green với text ở giữa : Báo chế biến , xóa đơn, Thanh toán.
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 59.h,
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(9.w),
                        ),
                        child: Center(
                          child: Text(
                            'Báo chế biến',
                            style: GoogleFonts.inter(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 59.h,
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(9.w),
                        ),
                        child: Center(
                          child: Text(
                            'Xóa đơn',
                            style: GoogleFonts.inter(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 59.h,
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(9.w),
                        ),
                        child: Center(
                          child: Text(
                            'Thanh toán',
                            style: GoogleFonts.inter(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildItem({required String foodName}) {
    return Container(
      height: 51.h,
      margin: EdgeInsets.only(bottom: 28.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.w),
        border: Border.all(
          color: AppColors.green,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.delete_outline,
                size: 25.sp,
              ),
              SizedBox(
                width: 15.w,
              ),
              // thêm một column chứa các widget vơi text là tên món ăn và giá tiền
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      color: AppColors.lightBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '50.000đ',
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 24.w,
                width: 24.w,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: Center(
                  child: Text(
                    '-',
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 56.w,
                height: 24.w,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: TextEditingController(text: '1'),
                  decoration: const InputDecoration(
                    isDense: true,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.green,
                      ),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.green,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.green,
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.green,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 24.w,
                    width: 24.w,
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    child: Center(
                      child: Text(
                        '+',
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
