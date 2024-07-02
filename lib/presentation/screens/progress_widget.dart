import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_study_flutter/design/custom_app_bar.dart';
import 'package:lets_study_flutter/design/components/activity_card_progress_component.dart';
import 'package:lets_study_flutter/logic/cubit/course_cubit.dart';
import 'package:lets_study_flutter/design/custom_bottom_app_bar.dart';

class ProgressWidgetPage extends StatefulWidget {
  @override
  _ProgressWidgetPageState createState() => _ProgressWidgetPageState();
}

class _ProgressWidgetPageState extends State<ProgressWidgetPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  List<bool> _isCheckedList = []; // Lista para controlar el estado de los checkboxes

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation =
        CurvedAnimation(parent: _animationController!, curve: Curves.linear);
    _animationController!.forward(); // Inicia la animación al cargar la página
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "Progreso Interactivo", isHomePage: false), // Barra de aplicación personalizada
      body: Center(
        child: ScaleTransition(
          scale: _animation!, // Aplica la animación de escala al contenido
          child: BlocBuilder<CourseCubit, CourseState>(
            builder: (context, state) {
              if (state is CourseLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GridView.builder(
                    itemCount: state.courses.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Dos columnas en la cuadrícula
                      crossAxisSpacing: 8, // Espacio entre elementos horizontalmente
                      mainAxisSpacing: 8, // Espacio entre elementos verticalmente
                      childAspectRatio: 3 / 2, // Relación de aspecto de cada elemento (ancho / alto)
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var courseItem = state.courses[index]; // Accede al elemento del curso según el índice
                      // Inicializa la lista de checkboxes si aún no se ha hecho
                      if (_isCheckedList.length != state.courses.length) {
                        _isCheckedList = List<bool>.filled(state.courses.length, false);
                      }
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 150,
                          width: 200,
                          color: courseItem.widgetColor, // Color de fondo del contenedor según el curso
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Transform.scale(
                                      scale: 1.3,
                                      child: Checkbox(
                                        checkColor: courseItem.widgetColor,
                                        activeColor: Colors.white,
                                        side: const BorderSide(color: Colors.white, width: 2),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        value: _isCheckedList[index],
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _isCheckedList[index] = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 12.0),
                                      child: Text(
                                        courseItem.courseName, // Nombre del curso
                                        style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 15.0),
                                  child: Text(
                                    "${courseItem.assignmentsDue} Tareas pendientes", // Número de tareas pendientes
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                ProgressComponent(
                                  progressComponentType: ProgressComponentType.linear,
                                  progress: courseItem.courseProgress, // Progreso del curso
                                  addProgressPercentage: false,
                                  progressColor: Colors.white,
                                  progressBgColor: courseItem.courseProgressBgColor ?? Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Container(); // Devuelve un contenedor vacío mientras se carga el estado
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(), // Barra de navegación inferior personalizada
    );
  }
}
