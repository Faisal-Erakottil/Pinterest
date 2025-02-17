import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinterest/presentation/botttomBar/cubit/bootombar_cubit.dart';
import 'package:pinterest/presentation/homeScreen/home.dart';

class BootomBar extends StatelessWidget {
  const BootomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BootombarCubit(),
      child: BlocBuilder<BootombarCubit, BootombarState>(
        builder: (context, state) {
          final cubit = context.read<BootombarCubit>();
          return Scaffold(
            backgroundColor: Colors.black,
            body: HomeScreen(),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              currentIndex: 0,
              onTap: (index) {
                cubit.updateIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 25,
                  ),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add,
                    color: Colors.grey,
                    size: 25,
                  ),
                  label: "add",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat_bubble_rounded,
                    color: Colors.grey,
                    size: 25,
                  ),
                  label: "Likes",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                    size: 25,
                  ),
                  label: "Profile",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
