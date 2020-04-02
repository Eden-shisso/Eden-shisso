import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/vote.dart';
import 'package:flutterapp/widgets/vote_list.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/models/vote.dart';
import 'package:flutterapp/state/vote.dart';


class HomeScreen extends StatefulWidget {



  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentStep = 0;


  @override
  void initState() {
    super.initState();
    //loading vote
    Future.microtask(() {
      Provider.of<VoteState>(context, listen: false).loadVoteList();
      Provider.of<VoteState>(context, listen: false).clearState();
    }

    );
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              child: Stepper(type: StepperType.horizontal,
               currentStep: _currentStep,
                  steps: [
           getStep(
             title: 'Choose',
             child: VoteListWidget(),
             isActive: true,

           ),
                getStep(
                  title: 'Vote',
                  child: VoteWidget(),
                  isActive: _currentStep >= 1 ? true : false,
                ),
          ],
                onStepContinue: (){
                if(_currentStep == 0){
                  if(step2Required()){
                    setState(() {
                      _currentStep = (_currentStep + 1) > 1 ? 1 : _currentStep + 1;
                    });
                  }else{
                    showSnackBar(context, 'Please select a vote first');
                  }
                }else if(_currentStep == 1){
                  if(step3Required()){
                    Navigator.pushReplacementNamed(context, '/result');

                  }else{
                    showSnackBar(context, 'please mark your vote!');
                  }
                }

                },
                onStepCancel: (){
                if(_currentStep <= 0){
                  Provider.of<VoteState>(context).activeVote = null;
                }else if(_currentStep <= 1) {
                  Provider.of<VoteState>(context).selectedOptionInActiveVote = null;

                }

                setState(() {
                  _currentStep = (_currentStep - 1) < 0 ? 0 : _currentStep - 1;
                });

                },
              ),
          ),
        ],
      ),
    );
  }
  bool step2Required(){
    if(Provider.of<VoteState>(context).activeVote == null){
      return false;
    }

    return true;
  }
  bool step3Required(){
    if(Provider.of<VoteState>(context).selectedOptionInActiveVote == null){
      return false;
    }

    return true;
  }
  void showSnackBar(BuildContext context,String msg){
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(fontSize: 22),
      ),
    ),

    );
  }

  Step getStep({String title, Widget child, bool isActive = false}){
    return Step(
      title: Text(title),
      content: child,
      isActive: isActive,
    );
  }
}
