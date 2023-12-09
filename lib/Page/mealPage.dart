import 'package:flutter/material.dart';
import 'package:responsi_124210039_2/data_source.dart';
import 'package:responsi_124210039_2/Model/meals_model.dart';
import 'package:responsi_124210039_2/Page/detailPage.dart';

class ListMeals extends StatefulWidget {
  final String Category;
  const ListMeals({super.key, required this.Category, required String category});

  @override
  State<ListMeals> createState() => _ListMealsState();
}

class _ListMealsState extends State<ListMeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Category),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.getMeals(widget.Category),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('ERROR'),
            );
          }
          if (snapshot.hasData) {
            Meal meal  = Meal.fromJson(snapshot.data!);
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: meal.meals?.length,
                itemBuilder: (context, int index) {
                  final Meals? meals = meal.meals?[index];
                  return Card(
                    child: SizedBox(


                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.network(
                              '${meals?.strMealThumb}',
                              height: 165,
                              width: 150,
                            ),
                          ),
                          Text(
                            '${meals?.strMeal}',
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  );
                }
            );
          }
          return Center(
            child: CircularProgressIndicator(color: Colors.deepOrange[900]),
          );
        },
      ),
    );
  }
}
//
// import 'package:flutter/material.dart';
// import 'package:responsi_124210039_2/data_source.dart';
// import 'package:responsi_124210039_2/Model/meals_model.dart';
// import 'package:responsi_124210039_2/Page/detailPage.dart';
//
// class ListMeals extends StatefulWidget {
//   final String category;
//
//   const ListMeals({Key? key, required this.category, required String Category}) : super(key: key);
//
//   @override
//   _ListMealsState createState() => _ListMealsState();
// }
//
// class _ListMealsState extends State<ListMeals> {
//   late Meal meal;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.category),
//         centerTitle: true,
//       ),
//       body: FutureBuilder(
//         future: ApiDataSource.instance.getMeals(widget.category),
//         builder: (BuildContext context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('ERROR'),
//             );
//           }
//           if (snapshot.hasData) {
//             meal = Meal.fromJson(snapshot.data!);
//             return GridView.builder(
//               gridDelegate:
//               SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//               itemCount: meal.meals?.length,
//               itemBuilder: (context, int index) {
//                 final Meals? meals = meal.meals?[index];
//                 return Card(
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DetailPage(
//                             mealId: meals?.idMeal ?? '',
//                           ),
//                         ),
//                       );
//                     },
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: Image.network(
//                             '${meals?.strMealThumb}',
//                             height: 165,
//                             width: 150,
//                           ),
//                         ),
//                         Text(
//                           '${meals?.strMeal}',
//                           textAlign: TextAlign.center,
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//           return Center(
//             child: CircularProgressIndicator(color: Colors.blue[900]),
//           );
//         },
//       ),
//     );
//   }
// }

