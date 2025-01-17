import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoyak/store/challenge_store.dart';
import 'package:yoyak/styles/screenSize/screen_size.dart';
import '../styles/colors/palette.dart';

class AllChallengeCard extends StatefulWidget {
  AllChallengeCard({super.key, this.challenge});

  final challenge;

  @override
  State<AllChallengeCard> createState() => _LookAroundChallengeCardState();
}

class _LookAroundChallengeCardState extends State<AllChallengeCard> {
  @override
  Widget build(BuildContext context) {
    context.watch<ChallengeStore>().othersChallengeList;
    context.watch<ChallengeStore>().allChallengeList;
    // var isCheered = context.watch<ChallengeStore>().isCheered;
    double cardWidth = ScreenSize.getWidth(context) * 0.4;
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 10),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Palette.MAIN_WHITE,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 0.4, color: Palette.SHADOW_GREY),
          ),
          width: cardWidth,
          height: 270,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ), // 둥근 모서리 반경 설정
                child: Image.network(
                  widget.challenge?['imgUrl'],
                  width: 200,
                  height: 110,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // 오류 발생 시 대체할 이미지
                    return Image.asset(
                      "assets/images/pillbox.jpg",
                      width: 200,
                      height: 110,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.challenge?['title'] ?? "챌린지 이름",
                      style: const TextStyle(
                        color: Palette.MAIN_BLACK,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ), // 게시물 제목
                    Text(
                      widget.challenge?['userNickname'] ?? "유저 닉네임",
                      style: const TextStyle(
                        color: Palette.SUB_BLACK,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${widget.challenge?['cheerCnt']}명이 응원해요",
                      style: const TextStyle(
                        color: Palette.SUB_BLACK,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ), //
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
