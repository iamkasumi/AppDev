import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     home: AffirmationsPage(),
   );
 }
}

class AffirmationsPage extends StatelessWidget {
 const AffirmationsPage({super.key});

 final List<Map<String, dynamic>> affirmationCategories = const [
   {
     'title': 'Mindful Affirmations',
     'subtitle': '10 affirmations',
     'color': Color.fromARGB(255, 183, 186, 171),
     'icon': Icons.self_improvement,
     'backgroundImage': 'images/cards/mindful.jpg',
     'affirmations': [
       'My mind is focused.',
       'I am present in the moment.',
       'I am gifted',
       'I let go of all resistance to change.',
       'I am present',
       'Good things are around me.',
       'I am present and fully engaged in this moment.',
       'I choose peace and tranquility over stress and worry.',
       'I am in control of my thoughts and emotions.',
       'My mind is clear, focused, and peaceful.',
     ]
   },
   {
     'title': 'Love and Relationships',
     'subtitle': '10 affirmations',
     'color': Color.fromARGB(255, 255, 192, 192), // Light red
     'icon': Icons.favorite,
     'backgroundImage': 'images/cards/love.jpg',
     'affirmations': [
       'I am loved.',
       'I deserve to be loved.',
       'I am grateful for the love and connection in my life.',
       'I nurture my relationships with care and understanding.',
       'I am surrounded by love and kindness.',
       'I am open to giving and receiving unconditional love.',
       'I am worthy of love and respect.',
       'I am committed to growing and evolving together.',
       'I appreciate and cherish the love in my life.',
       'I create a safe and loving space for my partner.',
       // Add more affirmations here
     ]
   },
   {
     'title': 'Health and Well-Being',
     'subtitle': '10 affirmations',
     'color': Color.fromARGB(255, 192, 255, 192), // Light green
     'icon': Icons.health_and_safety,
     'backgroundImage': 'images/cards/health.jpg',
     'affirmations': [
       'I am healthy and strong.',
       'I take care of my body.',
       'I embrace wellness in every aspect of my life.',
       'I honor my body with nutritious foods and regular exercise.',
       'I am mindful of my mental and emotional well-being.',
       'I deserve to feel vibrant and alive.',
       'I listen to my body and give it what it needs.',
       'I am strong, healthy, and full of energy.',
       'I prioritize my health and well-being daily.',
       'I am committed to a healthy and balanced lifestyle.',
       // Add more affirmations here
     ]
   },
   {
     'title': 'Financial Freedom and Wealth',
     'subtitle': '10 affirmations',
     'color': Color.fromARGB(255, 162, 222, 230), // Light blue
     'icon': Icons.attach_money,
     'backgroundImage': 'images/cards/wealth.jpg',
     'affirmations': [
       'I am financially free.',
       'Wealth flows to me easily.',
       'I am open to receiving abundance in all forms."',
       'I attract wealth and prosperity effortlessly.',
       'I am financially free and secure.',
       'I deserve financial success and abundance.',
       'I am a magnet for financial opportunities.',
       'I build and maintain wealth with ease.',
       'I create a life of financial freedom and stability.',
       'I am grateful for the wealth that flows into my life.',
       // Add more affirmations here
     ]
   },
   {
     'title': 'Gratitude',
     'subtitle': '10 affirmations',
     'color': Color.fromARGB(255, 237, 170, 83), // Light orange
     'icon': Icons.handshake,
     'backgroundImage': 'images/cards/gratitude.jpg',
     'affirmations': [
       'I am grateful for today.',
       'Gratitude fills my heart.',
       'I am grateful for the blessings in my life.',
       'Every day, I find reasons to be thankful.',
       'Gratitude fills my heart and soul.',
       'I appreciate the beauty around me.',
       'I am thankful for the love and support I receive.',
       'I acknowledge and cherish the small moments of joy.',
       'Gratitude transforms my perspective.',
       'I am thankful for the lessons life teaches me.',
       // Add more affirmations here
     ]
   },
   {
     'title': 'Self Confidence',
     'subtitle': '10 affirmations',
     'color': Color.fromARGB(255, 227, 237, 145), // Light brown
     'icon': Icons.emoji_events,
     'backgroundImage': 'images/cards/confidence.jpg',
     'affirmations': [
       'I am confident.',
       'I believe in myself.',
       'I believe in myself and my abilities.',
       'I am confident and capable in everything I do.',
       'I trust my decisions and choices.',
       'I am worthy of success and happiness.',
       'I embrace my uniqueness and strengths.',
       'I face challenges with courage and determination.',
       'I am proud of who I am and what I achieve.',
       'I speak and act with confidence.',
       // Add more affirmations here
     ]
   },
   {
     'title': 'Better Sleep',
     'subtitle': '10 affirmations',
     'color': Color.fromARGB(255, 208, 146, 227), // Mid blue
     'icon': Icons.bedtime,
     'backgroundImage': 'images/cards/sleep.jpg',
     'affirmations': [
       'I sleep peacefully.',
       'I wake up refreshed.',
       'I create a peaceful and calming bedtime routine.',
       'I am grateful for the restful sleep I enjoy.',
       'I let go of the days worries and embrace relaxation.',
       'My body and mind are ready for deep, restorative sleep.',
       'I deserve a full night of restful sleep.',
       'I wake up feeling refreshed.',
       'I create an environment that promotes excellent sleep.',
       'I breathe deeply and slowly, easing into sleep.',
       // Add more affirmations here
     ]
   },
      {
     'title': 'Release Stress and Anxiety',
     'subtitle': '10 affirmations',
     'color': Color.fromARGB(255, 242, 166, 199), // Mid pink
     'icon': Icons.spa,

     'backgroundImage': 'images/cards/stress_.jpg',
     'affirmations': [
       'I release stress and embrace calmness.',
       'I am in control of my thoughts and emotions.',
       'I let go of what I cannot change.',
       'I breathe deeply and feel my tension melt away.',
       'I find peace within myself.',
       'I am calm, centered, and grounded.',
       'I choose to focus on the positive aspects of my life.',
       'I trust that everything will work out for the best.',
       'I am resilient and can handle any challenge.',
       'I deserve peace and tranquility in my life.',
       // Add more affirmations here
     ]
   }
 ];

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('Affirmations'),
       backgroundColor: Color.fromARGB(255, 129, 243, 205),
     ),
     body: Padding(
       padding: const EdgeInsets.all(16.0),
       child: ListView.builder(
         itemCount: affirmationCategories.length,
         itemBuilder: (context, index) {
           final category = affirmationCategories[index];
           return Padding(
             padding: const EdgeInsets.symmetric(vertical: 8.0),
             child: Card(
               color: category['color'],
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15.0),
               ),
               child: ListTile(
                 contentPadding: const EdgeInsets.all(16.0),
                 leading: Icon(
                   category['icon'],
                   size: 40,
                   color: const Color.fromARGB(255, 97, 109, 105),
                 ),
                 title: Text(
                   category['title'],
                   style: const TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 subtitle: Text(category['subtitle']),
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => AffirmationDetailPage(
                         title: category['title'],
                         affirmations: category['affirmations'],
                         backgroundImage: category['backgroundImage'],
                       ),
                     ),
                   );
                 },
               ),
             ),
           );
         },
       ),
     ),
   );
 }
}

class AffirmationDetailPage extends StatelessWidget {
 final String title;
 final List<String> affirmations;
 final String backgroundImage;

 const AffirmationDetailPage({
   super.key,
   required this.title,
   required this.affirmations,
   required this.backgroundImage,
 });

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(title),
       backgroundColor: Color.fromARGB(255, 190, 236, 244),
     ),
     body: CarouselSlider.builder(
       options: CarouselOptions(
         height: MediaQuery.of(context).size.height * 0.7,
         enlargeCenterPage: true,
         enableInfiniteScroll: false,
       ),
       itemCount: affirmations.length,
       itemBuilder: (context, index, realIndex) {
         return Padding(
           padding: const EdgeInsets.all(16.0),
           child: Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage(backgroundImage),
                 fit: BoxFit.cover,
               ),
               borderRadius: BorderRadius.circular(15.0),
               boxShadow: [
                 BoxShadow(
                   color: Colors.black26,
                   blurRadius: 10,
                   offset: Offset(0, 5),
                 ),
               ],
             ),
             child: Card(
               color: Colors.transparent,
               elevation: 0,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15.0),
               ),
               child: Center(
                 child: Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Text(
                     affirmations[index],
                     style: const TextStyle(
                       fontSize: 24,
                       color: Colors.white,
                       shadows: [
                         Shadow(
                           offset: Offset(1.0, 1.0),
                           blurRadius: 3.0,
                           color: Colors.black,
                         ),
                       ],
                     ),
                     textAlign: TextAlign.center,
                   ),
                 ),
               ),
             ),
           ),
         );
       },
     ),
   );
 }
}