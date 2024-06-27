
part of 'education_cubit.dart';

abstract class EducationState extends Equatable {
  const EducationState();

  @override
  List<Object> get props => [];
}

class EducationInitial extends EducationState {}

class EducationLoaded extends EducationState {
  final Education educationInfo;

  const EducationLoaded(this.educationInfo);

  @override
  List<Object> get props => [educationInfo];
}

class Education {
    final String imgUrl;
    final String cardTitle;
    final double cardTitleSize;
    final String cardDescription;

  Education({
    required this.imgUrl,
    required this.cardTitle,
    required this.cardTitleSize,
    required this.cardDescription,

  });
}
