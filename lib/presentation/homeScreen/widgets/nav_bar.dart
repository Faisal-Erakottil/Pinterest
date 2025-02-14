// import 'package:flutter/material.dart';

// class CustomBottomNavBar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onItemTapped;

//   const CustomBottomNavBar({
//     super.key,
//     this.selectedIndex,
//     this.onItemTapped,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//         boxShadow: [
//           BoxShadow(color: Colors.black12, blurRadius: 10),
//         ],
//       ),
//       child: BottomNavigationBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.black54,
//         currentIndex: selectedIndex,
//         onTap: onItemTapped,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined, size: 30),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search, size: 30),
//             label: "Search",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border, size: 30),
//             label: "Likes",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline, size: 30),
//             label: "Profile",
//           ),
//         ],
//       ),
//     );
//   }
// }
