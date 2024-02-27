import 'package:flutter/material.dart';
import 'appraisal.dart';
import 'custom_card.dart';
import 'dictionary.dart';
import 'health_model.dart';
import 'responsive.dart';
import 'timespentscreen.dart';
import 'visited.dart';

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
                        MaterialPageRoute(builder: (context) =>CompanyCarousel()),
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
                        MaterialPageRoute(builder: (context) =>  VisitedScreen()),
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
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
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
                    if (index == 1 || index == 3) // Show additional PNGs for index 1 (Time spent) and 3 (Dictionary)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/clock.png', 
                          width: 24,
                          height: 24,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 28,
          child: FloatingActionButton(
            onPressed: () {
              // Implement your image scanning logic here
            },
            child: Icon(Icons.camera_alt),
          ),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 40,
          child: ElevatedButton(
            onPressed: () {
              // Add your button logic here
            },
            child: Text('Center Button'),
          ),
        ),
      ],
    );
  }
}
