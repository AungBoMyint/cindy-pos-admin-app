import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/pos/sales_controller.dart';
import '../../../widgets/pos/custom_card.dart';
import '../../../widgets/pos/sales_analysis/weekly_bar_chart.dart';
import 'daily_revenue.dart';

class MonthlyRevenue extends StatelessWidget {
  const MonthlyRevenue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SalesController _controller = Get.find();
    return !(_controller.dailySplayTreeMapList.value == null) &&
            (_controller.dailySplayTreeMapList.value!.isNotEmpty)
        ? Column(
            children: [
              Row(
                children: [
                  CustomCardForSales(
                    headTitleText: "${_controller
                        .getMonthName(_controller.getCurrentMonthDateTime())} အမြတ်",
                    color: Colors.red,
                    total: "${_controller.monthlyProfit()} ကျပ်",
                  ),
                  CustomCardForSales(
                    headTitleText: "${_controller
                        .getMonthName(_controller.getCurrentMonthDateTime())} ဝင်ငွေ",
                    color: Colors.green,
                    total: "${_controller.monthlyRevenue()} ကျပ်",
                  ),
                  CustomCardForSales(
                    headTitleText: "${_controller
                        .getMonthName(_controller.getCurrentMonthDateTime())} ရင်းနှီးငွေ",
                    color: Colors.blue,
                    total: "${_controller.monthlyOriginalRevenue()} ကျပ်",
                  ),
                ],
              ),
              const SizedBox(height: 15),

              const WeeklyBarChart(),

              //Note For Monthly LineChart
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    noteForDailyAnimateBarChart(
                        color: Colors.red, text: "အမြတ်"),
                    noteForDailyAnimateBarChart(
                        color: Colors.green, text: "ဝင်ငွေ"),
                    noteForDailyAnimateBarChart(
                        color: Colors.blue, text: "ရင်းနှီးငွေ"),
                  ],
                ),
              ),
            ],
          )
        : const CircularProgressIndicator();
  }
}
