import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CarOwnerRating extends StatefulWidget {
  const CarOwnerRating({super.key});

  @override
  State<CarOwnerRating> createState() => _CarOwnerRatingState();
}

class _CarOwnerRatingState extends State<CarOwnerRating> {
  double rating1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Car Owner Rating',
        )
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            Center(
              child: RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                 rating1 = rating;
                 print(rating);
               },
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
            height: 100,
            child: Column(
            children: const [
             SizedBox(
            height: 10,
            ),
             Expanded(
              child: TextField(
              decoration: InputDecoration(labelText: 'Enter Message'),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              expands: true, // <-- SEE HERE
              ),
            ),
           ],
        ),
      ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){}, child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}