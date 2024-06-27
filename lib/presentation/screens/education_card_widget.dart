import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lets_study_flutter/logic/cubit/education_cubit.dart';
import 'package:lets_study_flutter/design/custom_app_bar.dart';



class EducationCardWidgetPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
    value: BlocProvider.of<EducationCubit>(context),
    child: Scaffold(
      appBar: CustomAppBar(titleText: "My Activity", isHomePage: false),
      body: Center(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<EducationCubit, EducationState>(
              builder: (context, state) {
                if (state is EducationLoaded) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(state.educationInfo.imgUrl),
                      SizedBox(height: 10),
                      Text(
                        state.educationInfo.cardTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: state.educationInfo.cardTitleSize, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        state.educationInfo.cardDescription,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Opción 1'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Opción 2'),
                          ),
                        ],
                      ),
                    ],
                  
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }
          ),
        ),
      ),
    )
    ));
  }
}
