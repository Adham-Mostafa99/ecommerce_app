import 'package:flutter/material.dart';

class CustomBestSellingCard extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final String price;
  final double height;
  final bool isVisibleSubTitle;
  CustomBestSellingCard(
      {this.image,
      this.title,
      this.subTitle,
      this.price,
      this.height = 220,
      this.isVisibleSubTitle = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height,
              width: MediaQuery.of(context).size.width * 0.42,
              // width: width == null
              //     ? MediaQuery.of(context).size.width * 0.42
              //     : width,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),

            // FittedBox(
            //   fit: BoxFit.scaleDown,
            //   child: Text(
            //     title,
            //     style: TextStyle(fontSize: 18, color: Colors.black),
            //   ),
            // ),

            //to cut the long text and only show the first part if its too tall
            RichText(
              text: TextSpan(
                text: title,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              maxLines: 1,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 5),
            Visibility(
              visible: isVisibleSubTitle,
              child: Text(
                subTitle ?? ' ',
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              '\$$price',
              style: TextStyle(color: Colors.teal[600], fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
