import 'package:expenser_app/ui/constant.dart';
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
          body: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CircleAvatar(
                          backgroundColor:
                              isLight ? MyColors.bgBColor : MyColors.bgWColor,
                          child: Icon(
                            Icons.add,
                            color:
                                isLight ? MyColors.bgWColor : MyColors.bgBColor,
                            size: 21,
                          ),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 7,
                  child: Container(
                    //color: Colors.green.shade200,
                    child: Column(
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
                              style: mTextStylr26(mColor: isLight
                              ? MyColors.secoundryBColor
                              : MyColors.secondryWColor))
                        ]))
                      ],
                    ),
                  )),
              Expanded(
                  flex: 11,
                  child: ListView.builder(
                    itemCount: Constants.arrTransaction.length,
                    itemBuilder: (context, index) =>
                        dayWiseTrasanctionItem(Constants.arrTransaction[index]),
                  )),
            ],
          )),
    );
  }

  Widget dayWiseTrasanctionItem(Map dayTransDetails) {
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
}
