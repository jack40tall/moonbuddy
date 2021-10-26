import 'package:flutter/material.dart';
import 'package:frontend/components/strategy_card.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/data_models/strategy_model.dart';
import 'package:frontend/data_models/user.dart';
import 'package:openapi/api.dart';

class DashboardScreen extends StatefulWidget {
  static const String id = 'summary_screen';
  final User currUser;
  DashboardScreen({Key key, @required this.currUser}) : super(key: key);
  @override
  _SummaryScreen createState() => _SummaryScreen(currUser);
}

class _SummaryScreen extends State<DashboardScreen> {
  User _currUser;

  _SummaryScreen(User currUser) {
    this._currUser = currUser;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundDark,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              "SEARCH BAR",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'Horizon',
              ),
            ),
            SizedBox(height: 13.0),

            /* ADD LATER */

            // SizedBox(
            //   width: double.infinity,
            //   child: Text(
            //     " Bot builder",
            //     style: TextStyle(fontSize: 18.0),
            //     textAlign: TextAlign.left,
            //   ),
            // ),

            // Container(
            //   padding: EdgeInsets.all(25.0),
            //   decoration: BoxDecoration(
            //     color: Colors.deepPurple,
            //     borderRadius: BorderRadius.circular(15.0),
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Text(
            //         "Build or upload your own bot",
            //         style: TextStyle(
            //           fontSize: 19,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.white,
            //         ),
            //       ),
            //       SizedBox(
            //         height: 11.0,
            //       ),
            //       Row(
            //         children: <Widget>[
            //           Text(
            //             "Total amount",
            //             style: TextStyle(color: Colors.grey[300]),
            //           )
            //         ],
            //       ),
            //       FutureBuilder(
            //           future: fetchTotalValue(),
            //           builder: (context, snapshot) {
            //             if (snapshot.hasData) {
            //               return RichText(
            //                 text: TextSpan(
            //                   children: [
            //                     TextSpan(
            //                       text: snapshot.data.toString() != ""
            //                           ? snapshot.data.toString()
            //                           : "\$0",
            //                       style: Theme.of(context)
            //                           .textTheme
            //                           .headline4
            //                           .apply(
            //                               color: Colors.white,
            //                               fontWeightDelta: 2),
            //                     ),
            //                   ],
            //                 ),
            //               );
            //             } else {
            //               return Text('Loading...');
            //             }
            //           })
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 50.0,
            // ),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: Text(
                "Available bots",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.left,
              ),
            ),

            /* DUMMY CARD */
            Container(
              padding: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: kFifthBlueDark,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Mean reversion",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "6473 ",
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                color: kSecondaryPinkDark),
                          ),
                          Icon(Icons.favorite, color: kPrimaryPinkDark)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 11.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 60, 0),
                    child: Text(
                      "Capitalize on extreme price changes of a securtiy, assuming that it will revert to its long-run average level.",
                      style: TextStyle(
                          color: kSecondaryPinkDark, height: 1.5, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Creator: " + "Moon Buddy",
                            style: TextStyle(color: kCreatorGrey, height: 1.5),
                          ),
                          Material(
                            elevation: 2.0,
                            color: kButtonGreen,
                            borderRadius: BorderRadius.circular(50.0),
                            child: MaterialButton(
                                onPressed: () => {},
                                minWidth: 80.0,
                                height: 35.0,
                                child: Text(
                                  "\$3.99",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: .6,
                                  ),
                                )),
                          ),
                        ],
                      ))
                ],
              ),
            ),

            // FutureBuilder(
            //     future: fetchStrategies(),
            //     builder: (BuildContext context, AsyncSnapshot snapshot) {
            //       // print("before if");
            //       if (snapshot.hasData) {
            //         return ListView.builder(
            //           shrinkWrap: true,
            //           physics: NeverScrollableScrollPhysics(),
            //           itemCount: snapshot.data.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             return StrategyCard(
            //               title: snapshot.data[index].strategyName,
            //               description: snapshot.data[index].description,
            //               strategy: snapshot.data[index].strategyId,
            //               selectedStrategy: _currUser.investmentStrategy,
            //               onPressed: () {
            //                 print(index);
            //               },
            //             );
            //           },
            //         );
            //       } else if (snapshot.hasError) {
            //         return Column(
            //           children: [
            //             const Icon(
            //               Icons.error_outline,
            //               color: Colors.red,
            //               size: 60,
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(top: 16),
            //               child: Text('Error: ${snapshot.error}'),
            //             )
            //           ],
            //         );
            //       } else {
            //         // print('project snapshot data is: ${snapshot.data}');
            //         return Center(child: LinearProgressIndicator());
            //       }
            //     })

            /* Not sure what this is for */
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: strategyData.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return StrategyCard(
            //         title: strategyData[index].strategyName,
            //         description: strategyData[index].description,
            //         onPressed: () {});
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Future<List<InvestmentStrategy>> fetchStrategies() async {
    List<InvestmentStrategy> strategyData = [];
    final apiInstance = StrategiesApi();

    try {
      final result = apiInstance.strategiesGet();
      var response = await result;

      response.strategies.forEach((current) => {
            strategyData.add(InvestmentStrategy(
                strategyId: current.investmentStrategyId,
                strategyName: current.investmentStrategyName,
                lowerRiskBound: current.riskLowerBound,
                upperRiskBound: current.riskUpperBound,
                description: current.strategyDescription))
          });
      return strategyData;
    } catch (e) {
      print('Exception when calling StrategiesApi->strategies.get(): $e\n');
      return null;
    }
  }

  Future<String> fetchTotalValue() async {
    final apiInstance = UsersApi();

    try {
      final result = apiInstance.usersUserIdAllholdingsGet(
          _currUser.userId, _currUser.token);
      var response = await result;
      return response.totalValue;
    } catch (e) {
      print('Exception when calling UsersApi->usersUserIdAllholdingsGet: $e\n');
      return null;
    }
  }
}
