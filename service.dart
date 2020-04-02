import 'package:flutterapp/models/vote.dart';
import 'package:uuid/uuid.dart';

List<Vote> getVoteList() {
  List <Vote> voteList = List<Vote>();

  voteList.add(
    Vote(
      voteId: Uuid().v4(),
      voteTitle: 'Best Mobile Frameworks?',
      options: [
        {'Flutter': 70},
        {'React Native': 70},
        {'Xamarin': 70},

      ],
    ),
  );

  voteList.add(
    Vote(
      voteId: Uuid().v4(),
      voteTitle: 'Best Web Frontend Frameworks?',
      options: [
        {'React': 80},
        {'Angular': 40},
        {'Vue': 20},

      ],
    ),
  );

  voteList.add(
    Vote(
      voteId: Uuid().v4(),
      voteTitle: 'Best Web Backgroud Frameworks?',
      options: [
        {'Django': 50},
        {'Laravel': 30},
        {'Express.js': 50},

      ],
    ),
  );
  return voteList;
}