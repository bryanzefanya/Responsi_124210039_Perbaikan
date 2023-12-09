// detailPage.dart
import 'package:flutter/material.dart';
import 'package:responsi_124210039_2/data_source.dart';
import 'package:responsi_124210039_2/Model/details_model.dart';

class DetailPage extends StatefulWidget {
  final String mealId;

  const DetailPage({Key? key, required this.mealId}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Detail detail;

  @override
  void initState() {
    super.initState();
    fetchDetail(widget.mealId);
  }

  Future<void> fetchDetail(String mealId) async {
    try {
      var data = await ApiDataSource.instance.getDetailMeals(mealId);

      if (data != null && data['meals'] != null) {
        setState(() {
          detail = Detail.fromJson(data);
        });
      } else {
        print('Error: Meal detail data is null or invalid response');
      }
    } catch (e) {
      print('Error fetching meal detail data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Detail'),
        centerTitle: true,
      ),
      body: detail != null
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              detail.meals?[0].strMealThumb ?? '',
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              detail.meals?[0].strMeal ?? '',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Category: ${detail.meals?[0].strCategory ?? ''}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Area: ${detail.meals?[0].strArea ?? ''}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Instructions:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              detail.meals?[0].strInstructions ?? '',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
