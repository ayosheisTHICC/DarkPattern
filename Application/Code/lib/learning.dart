import 'package:flutter/material.dart';

class DarkPatternScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dark Patterns'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: darkPatterns.length,
          itemBuilder: (context, index) {
            return DarkPatternCard(
              darkPattern: darkPatterns[index],
              color: colors[index % colors.length],
            );
          },
        ),
      ),
    );
  }
}

class DarkPatternCard extends StatelessWidget {
  final DarkPattern darkPattern;
  final Color color;

  DarkPatternCard({required this.darkPattern, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height:100, // Adjust the height of the image
            child: ClipRect(
              child: Image.asset(
                darkPattern.image,
                width: double.infinity,
                height: double.infinity, // Maintain aspect ratio
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              darkPattern.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '${darkPattern.description}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DarkPattern {
  final String image, title, description;
  final int id;

  DarkPattern({
    required this.image,
    required this.title,
    required this.description,
    required this.id,
  });
}

List<DarkPattern> darkPatterns = [
  DarkPattern(
    id: 1,
    title: "Bait and Switch",
    image: "assets/darkpatt/baitandswitch.jpg",
    description: "Deceptive technique to lure users into unwanted actions.",
  ),
  DarkPattern(
    id: 2,
    title: "Forced Continuity",
    image: "assets/darkpatt/Forced Continuity.png",
    description: "Trapping users into ongoing payments without consent.",
  ),
  DarkPattern(
    id: 3,
    title: "Misdirection",
    image: "assets/darkpatt/Misdirection.png",
    description: "Redirecting user attention away from the intended action or purpose, leading them to make unintended choices.",
  ),
  DarkPattern(
    id: 4,
    title: "Hidden Costs",
    image: "assets/darkpatt/hiddencosts.jpg",
    description: "Concealing additional charges or fees until late in the user journey, catching users by surprise.",
  ),
  DarkPattern(
    id: 5,
    title: "Roach Motel",
    image: "assets/darkpatt/rotal.png",
    description: "Making it easy for users to sign up or subscribe but deliberately difficult for them to cancel or leave.",
  ),
  DarkPattern(
    id: 6,
    title: "Trick Questions",
    image: "assets/darkpatt/Trick Questions.png",
    description: "Presenting questions or options in a way that manipulates users into making unintended choices.",
  ),
  DarkPattern(
    id: 7,
    title: "Privacy Zuckering",
    image: "assets/darkpatt/zucker.jpg",
    description: "Misleading users into sharing more information than they intend to by framing it as necessary or beneficial.",
  ),
  DarkPattern(
    id: 8,
    title: "Confirmshaming",
    image: "assets/darkpatt/Confirmshaming.png",
    description: "Using guilt or shame to pressure users into choosing a specific option, such as opting into newsletters.",
  ),
  DarkPattern(
    id: 9,
    title: "Friend Spam",
    image: "assets/darkpatt/Friend Spam.jpg",
    description: "Gaining access to a user's contacts or social network and sending messages without their explicit consent.",
  ),
  DarkPattern(
    id: 10,
    title: "Urgency",
    image: "assets/darkpatt/Urgency.png",
    description: "Creating a false sense of urgency to pressure users into making quick decisions, often leading to impulse purchases.",
  ),
  DarkPattern(
    id: 11,
    title: "Sneak into Basket",
    image: "assets/darkpatt/Sneak into Basket.png",
    description: "Adding extra items to a user's shopping cart without their clear consent, usually with the intention of boosting sales.",
  ),
  DarkPattern(
    id: 12,
    title: "Disguised Ads",
    image: "assets/darkpatt/Disguised Ads.jpg",
    description: "Presenting advertisements in a way that makes them appear as regular content, tricking users into clicking on them.",
  ),
  
];

List<Color> colors = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.teal,
  Colors.amber,
  Colors.deepOrange,
  Colors.indigo,
  Colors.lightBlue,
  Colors.pink,
  Colors.deepPurple,
  Colors.cyan,
];
