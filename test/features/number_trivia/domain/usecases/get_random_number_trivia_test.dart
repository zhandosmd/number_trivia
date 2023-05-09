import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository{}

void main(){
  MockNumberTriviaRepository mockNumberTriviaRepository = MockNumberTriviaRepository();
  GetRandomNumberTrivia usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);

  // setUp(() {
  //   mockNumberTriviaRepository = MockNumberTriviaRepository();
  //   usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  // });

  const tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia from the repository',
        () async {
      when(mockNumberTriviaRepository.getRandomNumberTrivia()) // any
        .thenAnswer((_) async => const Right(tNumberTrivia));
      final result = await usecase(NoParams());
      expect(result, const Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}