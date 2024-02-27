import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CompanyCarousel extends StatefulWidget {
  @override
  _CompanyCarouselState createState() => _CompanyCarouselState();
}

class _CompanyCarouselState extends State<CompanyCarousel> {
  final CarouselController _carouselController = CarouselController();
  int _current = 0;

  final List<Map<String, dynamic>> _companies = [
    {
      'name': 'Amazon',
      'image': 'assets/images/amazon.jpg',
      'percentage': '80%',
      'info': 'Amazon has been criticized for using dark patterns in its user interface design, including misleading language, hidden opt-outs, and adding items to shopping carts without clear notification. These tactics can manipulate users into agreeing to terms or making purchases unwittingly.',
      'flagColor': Colors.red,
    },
    {
      'name': 'Facebook',
      'image': 'assets/images/facebook.png',
      'percentage': '65%',
      'info': 'Facebook has been criticized for employing dark patterns, including complex privacy settings and misleading language, which can manipulate users into sharing more information. They often bury opt-out options, use confusing interfaces, and push updates without clear notification, potentially leading to unintended consequences or changes in privacy settings. Ongoing scrutiny influences how Facebook and similar companies design their interfaces.',
      'flagColor': Colors.blue,
    },
    {
  'name': 'Lucidchart',
  'image': 'assets/images/lucidchart.png',
  'percentage': '75%',
  'info': 'Lucidchart has faced criticism for using dark patterns, such as misleading language and complex interface designs, in its products and services. These practices can lead to unintended purchases or agreements by users who may not fully understand the implications. While Lucidchart has made efforts to enhance transparency and user control, ongoing scrutiny plays a role in influencing their design decisions.',
  'flagColor': Colors.yellow,
},
{
  'name': 'Abhibus',
  'image': 'assets/images/abhibus.jpg',
  'percentage': '70%',
  'info': 'Abhibus has been criticized for using dark patterns in its user interface design, including misleading information and confusing booking processes. These tactics can lead to users making unintended bookings or agreeing to terms they did not fully understand. Despite efforts to improve transparency, ongoing scrutiny continues to influence how Abhibus and similar companies design their interfaces.',
  'flagColor': Colors.orange,
},
{
  'name': 'Softonic',
  'image': 'assets/images/softonic.png',
  'percentage': '60%',
  'info': 'Softonic has faced criticism for using dark patterns in its user interface design, including misleading language and deceptive download buttons. These tactics can mislead users into downloading software they did not intend to or agreeing to additional software installations. Despite efforts to improve transparency, ongoing scrutiny influences how Softonic and similar companies design their interfaces.',
  'flagColor': Colors.green,
},
{
  'name': 'Canva',
  'image': 'assets/images/canva.png',
  'percentage': '55%',
  'info': 'Canva has been criticized for using dark patterns in its interface, such as misleading pricing information and subscription models that can lead to unintentional charges. These practices can manipulate users into paying for services they may not fully understand or need. Canva is working to improve transparency and user control in its design to address these concerns.',
  'flagColor': Colors.purple,
},
{
  'name': 'Geeks for geeks ',
  'image': 'assets/images/gfg.png',
  'percentage': '45%',
  'info': 'It appears youve experienced forced actions on the Geeks for Geeks website. Forced actions in UI design can include tactics like misleading language, hidden opt-outs, or other strategies that compel users to take actions they didnt intend to. If you could provide specific examples of these forced actions on Geeks for Geeks, I can help you summarize them.',
  'flagColor': Colors.cyan,
},
    
  ];

  Color _getColorFromPercentage(String percentage) {
    final int value = int.tryParse(percentage.replaceAll('%', '')) ?? 0;
    if (value >= 90) {
      return Color.fromARGB(255, 255, 0, 0);
    } else if (value >= 80) {
      return Color.fromARGB(255, 255, 153, 0);
    } else if (value >= 70) {
      return Color.fromARGB(255, 255, 251, 4);
    } else if (value >= 60) {
      return Color.fromARGB(255, 201, 205, 0);
    } else {
      return Color.fromARGB(255, 1, 255, 39);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.70,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              carouselController: _carouselController,
              items: _companies.map((company) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              margin: const EdgeInsets.only(top: 30),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(company['image'], fit: BoxFit.cover),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              company['name'],
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                AnimatedContainer(
                                  width: MediaQuery.of(context).size.width * 0.70,
                                  height: 8,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                  decoration: BoxDecoration(
                                    color: _getColorFromPercentage(company['percentage']),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.flag,
                                  color: company['flagColor'], // Use flag color from data
                                  size: 25,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  company['percentage'],
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey.shade600,
                                    decoration: TextDecoration.none, // Remove underline
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _companies.map((company) {
                int index = _companies.indexOf(company);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 0, 0, 0),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            _current < _companies.length
                ? Text(
              'Company Info: ${_companies[_current]['info']}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 255, 254, 250),
              ),
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
