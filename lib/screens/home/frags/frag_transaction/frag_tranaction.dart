import 'package:expenser_app/ui/custom_widgets/ui_helper.dart';
import 'package:flutter/material.dart';

class FragTransaction extends StatelessWidget {
  const FragTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(color: Colors.blue.shade200,)),
            Expanded(
                flex: 7,
                child: Container(color: Colors.green.shade200,)),
            Expanded(
                flex: 11,
                child: ListView.builder(
                  itemCount: 14,
                  itemBuilder: (context, index) => dayWiseTrasanctionItem(),)),
          ],
        )
      ),
    );
  }

  Widget dayWiseTrasanctionItem(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Today',style: mTextStylr12(mColor: Colors.grey),),
              Text('\$ 7.25',style: mTextStylr12(mColor: Colors.grey),)
            ],
          ),
        ),
        //SizedBox(height: 21,),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, index) => detailTransactionItem(),),
        SizedBox(height: 21,),
      ],
    );
  }



  Widget detailTransactionItem(){
    return ListTile(
      leading: Image.asset('assets/images/expense_type/popcorn.png'),
      title: Text('Watched a movie',style: mTextStylr12(mColor: Colors.black,
          fontweight: FontWeight.bold),),
      subtitle: Text('with Friends', style: mTextStylr12(mColor: Colors.black),),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('\$ 3.38', style: mTextStylr12(mColor: Colors.grey, fontweight: FontWeight.bold),),
          Text('\$ 3.38', style: mTextStylr12(mColor: Colors.grey),)
        ],
      ),
    );
  }

}
