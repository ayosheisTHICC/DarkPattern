import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../appraisal.dart';
import '../../../custom_card.dart';
import '../../../dictionary.dart';
import '../../../health_model.dart';
import '../../../messagescreen.dart';
import '../../../responsive.dart';
import '../../../timespentscreen.dart';
import '../../../visited.dart';
class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({Key? key}) : super(key: key);

  final List<HealthModel> healthDetails = const [
    HealthModel(
      icon: 'assets/appraisal.svg',
      value: " ",
      title: "Appraisal",
    ),
    HealthModel(
      icon: 'assets/clock.svg',
      value: "7h48m",
      title: "Time spent",
    ),
    HealthModel(
      icon: 'assets/visit.svg',
      value: "9786",
      title: "Number of sites visited",
    ),
    HealthModel(
      icon: 'assets/book.svg',
      value: " ",
      title: "Dictionary",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          itemCount: healthDetails.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
            crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
            mainAxisSpacing: 12.0,
          ),
          itemBuilder: (context, index) {
            return CustomCard(
              child: GestureDetector(
                onTap: () {
                  // Navigate to different screens based on the index
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CompanyCarousel()),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebsiteScreen ()),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VisitedScreen()),
                      );
                      break;
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DarkPatternDictionary()),
                      );
                      break;
                    default:
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      healthDetails[index].icon,
                      width: 50, // Adjust as needed
                      height: 50, // Adjust as needed
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 4),
                      child: Text(
                        healthDetails[index].value,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      healthDetails[index].title,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 5.0,
          
          left: 149.8, // Adjust button position based on screen width
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DarkPatternAnalyzerScreen()),
            );
            },
            child: const Icon(Icons.qr_code_scanner),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height / 2 - 28,
          left: MediaQuery.of(context).size.width / 2 - 28, 
          child: FloatingActionButton(
            onPressed: () {
              // Implement your logic here
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }                        
}
void main() { 
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ActivityDetailsCard(),
      ),
    ),
  );
}
