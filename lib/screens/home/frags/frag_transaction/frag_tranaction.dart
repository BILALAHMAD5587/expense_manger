import 'package:expenser_app/ui/constant.dart';
import 'package:expenser_app/ui/custom_widgets/custom_rounded_btn.dart';
import 'package:expenser_app/ui/custom_widgets/ui_helper.dart';
import 'package:flutter/material.dart';

class FragTransaction extends StatelessWidget {
  bool isLight = true;

  @override
  Widget build(BuildContext context) {
    isLight = Theme.of(context).brightness == Brightness.light;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: MediaQuery.of(context).orientation == Orientation.portrait
              ? portraitUI()
              : landscapeUI()),
    );
  }

  Widget landscapeUI() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                totalBalanceUI(),
                SizedBox(
                  height: 21,
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: CustomRoundedBtn(
                    callback: () {},
                    text: '',
                    mchild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,
                            color: isLight
                                ? MyColors.bgWColor
                                : MyColors.bgBColor),
                        Text(
                          'Add Expense',
                          style: mTextStylr16(
                              mColor: isLight
                                  ? MyColors.bgWColor
                                  : MyColors.bgBColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
        Expanded(flex: 1, child: allTransactionUI())
      ],
    );
  }

  Widget portraitUI() {
    return Column(
      children: [
        Expanded(flex: 1, child: addTransactionUI()),
        Expanded(flex: 7, child: totalBalanceUI()),
        Expanded(flex: 11, child: allTransactionUI()),
      ],
    );
  }

  Widget dayWiseTransactiodItem(Map dayTransDetails) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dayTransDetails['day'],
                  style: mTextStylr12(
                      mColor: isLight
                          ? MyColors.secoundryBColor
                          : MyColors.secondryWColor),
                ),
                Text(
                  '\$ ${dayTransDetails['amt']}',
                  style: mTextStylr12(
                      mColor: isLight
                          ? MyColors.secoundryBColor
                          : MyColors.secondryWColor),
                )
              ],
            ),
          ),
          //SizedBox(height: 21,),
          ListView.builder(
            itemCount: dayTransDetails['transaction'].length,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                detailTransactionItem(dayTransDetails['transaction'][index]),
          ),
          SizedBox(
            height: 21,
          ),
        ],
      ),
    );
  }

  Widget detailTransactionItem(Map detailedTrans) {
    return ListTile(
      leading: Image.asset(detailedTrans['image']),
      title: Text(
        detailedTrans['title'],
        style: mTextStylr12(
            mColor: isLight ? MyColors.textWColor : MyColors.textBColor,
            fontweight: FontWeight.bold),
      ),
      subtitle: Text(
        detailedTrans['desc'],
        style: mTextStylr12(
            mColor: isLight ? MyColors.textWColor : MyColors.textBColor),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '\$ ${detailedTrans['amt']}',
            style: mTextStylr12(
                mColor: isLight ? MyColors.textWColor : MyColors.textBColor,
                fontweight: FontWeight.bold),
          ),
          Text(
            '\$ ${detailedTrans['balance']}',
            style: mTextStylr12(
                mColor: isLight ? MyColors.textWColor : MyColors.textBColor),
          )
        ],
      ),
    );
  }

  Widget addTransactionUI() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: CircleAvatar(
            backgroundColor: isLight ? MyColors.bgBColor : MyColors.bgWColor,
            child: Icon(
              Icons.add,
              color: isLight ? MyColors.bgWColor : MyColors.bgBColor,
              size: 21,
            ),
          ),
        ),
      ),
    );
  }

  Widget totalBalanceUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Spent this week',
            style: mTextStylr12(
                mColor: isLight
                    ? MyColors.secoundryBColor
                    : MyColors.secondryWColor)),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: '\$ ',
              style: mTextStylr26(
                  mColor: isLight
                      ? MyColors.secoundryBColor
                      : MyColors.secondryWColor,
                  fontweight: FontWeight.bold)),
          TextSpan(
              text: '9999',
              style: mTextStylr52(
                  mColor: isLight
                      ? MyColors.secoundryBColor
                      : MyColors.secondryWColor,
                  fontweight: FontWeight.bold)),
          TextSpan(
              text: '.50',
              style: mTextStylr26(
                  mColor: isLight
                      ? MyColors.secoundryBColor
                      : MyColors.secondryWColor))
        ]))
      ],
    );
  }

  Widget allTransactionUI() {
    return ListView.builder(
      itemCount: Constants.arrTransaction.length,
      itemBuilder: (context, index) =>
          dayWiseTransactiodItem(Constants.arrTransaction[index]),
    );
  }
}
