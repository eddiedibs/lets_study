import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lets_study_flutter/logic/cubit/education_cubit.dart';
import 'package:lets_study_flutter/design/custom_app_bar.dart';

class EducationCardWidgetPage extends StatelessWidget {
  const EducationCardWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<EducationCubit>(context), // Proporciona el cubit de Educación al árbol de widgets
      child: Scaffold(
        appBar: CustomAppBar(titleText: "Mi perfil", isHomePage: false), // Barra de aplicación personalizada
        body: Column(
          children: [
            const Expanded(flex: 2, child: _TopPortion()), // Sección superior
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlocBuilder<EducationCubit, EducationState>(
                  builder: (context, state) {
                    if (state is EducationLoaded) {
                      return Column(
                        children: [
                          Text(
                            state.educationInfo.cardTitle, // Título dinámico desde el estado
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            state.educationInfo.cardDescription, // Descripción dinámica desde el estado
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 28),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton.extended(
                                onPressed: () {}, // Acción placeholder para seguir
                                heroTag: 'follow',
                                elevation: 0,
                                label: const Text("Seguir"),
                                icon: const Icon(Icons.person_add_alt_1),
                              ),
                              const SizedBox(width: 16.0),
                              FloatingActionButton.extended(
                                onPressed: () {}, // Acción placeholder para enviar mensaje
                                heroTag: 'mesage',
                                elevation: 0,
                                backgroundColor: Colors.red,
                                label: const Text("Enviar mensaje"),
                                icon: const Icon(Icons.message_rounded),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const _ProfileInfoRow() // Widget para mostrar información de perfil
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator()); // Indicador de carga mientras se espera el estado
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({Key? key}) : super(key: key);

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("Posts", 900),
    ProfileInfoItem("Seguidores", 120),
    ProfileInfoItem("Siguiendo", 200),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map((item) => Expanded(
                  child: Row(
                    children: [
                      if (_items.indexOf(item) != 0) const VerticalDivider(),
                      Expanded(child: _singleItem(context, item)), // Widget para cada elemento de información de perfil
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.value.toString(), // Valor del elemento de perfil
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            item.title, // Título del elemento de perfil
            style: Theme.of(context).textTheme.caption,
          )
        ],
      );
}

class ProfileInfoItem {
  final String title;
  final int value;
  const ProfileInfoItem(this.title, this.value);
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<EducationCubit>(context), // Proporciona el cubit de Educación al árbol de widgets
      child: BlocBuilder<EducationCubit, EducationState>(
        builder: (context, state) {
          if (state is EducationLoaded) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xff0043ba), Color(0xff006df1)],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.network(state.educationInfo.imgUrl), // Imagen dinámica desde el estado
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            child: Container(
                              margin: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container(); // Devuelve un contenedor vacío mientras se espera el estado
          }
        },
      ),
    );
  }
}
