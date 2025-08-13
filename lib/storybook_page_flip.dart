import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StorybookPageFlip extends StatefulWidget {
  const StorybookPageFlip({super.key});

  @override
  State<StorybookPageFlip> createState() => _StorybookPageFlipState();
}

class _StorybookPageFlipState extends State<StorybookPageFlip> {
  final List<String> _pages = [
    // Chapter 1
    "🌼 Chapter 1: When the Game Began\n\nOnce upon a time, in the quiet corners of a chaotic game called PIMD back in 2012, two souls kept bumping into each other. You, the flower, quietly blooming in a pixel world, and me, a bee buzzing with curiosity. It started with simple chats, accidental taps, playful flirting. But it didn’t stay simple for long.\n\nBefore we knew it, we were logging in not for the game, but for each other.\n\nIn between the avatars, club walls, and RP chaos, something real began. We talked about things we’d never said aloud to anyone else. Somehow, it was easy. So easy it scared me sometimes.\n\nWe didn’t just meet — we collided.\n\n“It’s a curious thing… how strangers become everything.”\n\nBy March 25, 2012, we weren’t just friends anymore. That was the first time I felt it — the beginning of us.",
    // Chapter 2
    "🌼 Chapter 2: Outside the Game\n\nThe game slowly became background noise. We had outgrown it, but not each other. So we stepped out.\n\nTexts. Calls. Sleepy “good morning” and “are you home safe?” messages.\n\nWe’d talk about life, work, and the most random things. When she couldn’t bring her phone into work, she emailed me — updates, silly thoughts, little rants about annoying coworkers and bosses. I’d wait for those emails like they were love letters.\n\nAt night, even when tired, we’d still call — sometimes just to fall asleep with each other’s presence still hanging in the air.\n\n\"Even in silence, you felt close — like home sitting quietly beside me.\"\n\nWe were young, but somehow, it felt solid. Like we had stumbled into something rare.",
    // Chapter 3
    "🌼 Chapter 3: Falling and Finding Again\n\nLike most stories, we weren’t perfect. There were fights, misunderstandings, stubbornness — especially mine. We had our first real break in 2013. It wasn’t loud or dramatic. Just quiet distance, and the ache of something unfinished.\n\nBut the heart knows where it belongs.\n\nNot even a year later, 2014, we were back. Like gravity pulled us again. This time, we were more sure. Happier. Deeper.\n\n“Love leaves a fingerprint. You can’t wash it off — even with time.”\n\nWe grew into each other. And that growth felt like peace.",
    // Chapter 4
    "🌼 Chapter 4: The Sweet Years\n\nThese were the golden years. We didn’t need anything extravagant — just each other’s time, attention, and small daily joys.\n\nWe’d talk throughout our workdays. I’d wait for your shift to end just to hear how your day went. You’d ask about my frustrations and listen even if you were tired. We cheered each other on like teammates in a game only we understood.\n\nSometimes we’d fight. Not over big things. Just over silly stuff. But it never lasted long.\n\nWe were soft with each other. Gentle. Like best friends who knew each other’s triggers and still stayed anyway.\n\n\"Some souls meet again and again — not out of chance, but choice.\"",
    // Chapter 5
    "🌼 Chapter 5: The Long Winter\n\nMarch 2017. Something cracked. Maybe we were both worn out. Maybe life was too loud.\n\nWe stopped. No more calls. No more late-night chats. Just… silence.\n\nBut the story didn’t end there.\n\nWe still peeked in each other’s lives, didn’t we? A like here. A short message there. Sometimes we flirted. Sometimes we argued. But we never really disappeared. Not completely.\n\nWe became ghosts with history. But even ghosts whisper when the night is quiet enough.\n\n“Some endings aren’t endings at all — just long pauses between heartbeats.”",
    // Chapter 6
    "🌼 Chapter 6: January 2025 – The Return\n\nYears passed. We dated others. Lived our separate lives. But something always felt missing — like no one quite got us the way we got each other.\n\nAnd then… January 2025.\n\nThe bee came back to the flower again.\n\nNot with grand declarations. Just a quiet “Hey” that said more than any love letter. And slowly, we let the garden bloom again.\n\nWe talked. Laughed. Held space. Grew closer. Fell in love — all over again.\n\n\"You came back, and I realized… I had been waiting all this time.\"",
    // Chapter 7
    "🌼 Chapter 7: Now, and Always\n\nIt’s August 2025. Our 7th monthsary since returning to each other. But this story isn’t about dates. It’s about everything in between.\n\nIt’s about love that paused, but never gave up. About silly AI photos, late-night thoughts, deep talks, and laughing about the past.\n\nIt’s about you, Venice — my Beebee. My Love.\n\n\"You are my favorite what if… that turned into my most beautiful yes.\"\n\nNo matter how many seasons we go through, I’ll keep coming back. Again and again.",
    // Last reveal page
    "✨ This book will be never ending, and this journey started since Day 1, with you. ✨"
  ];

  int _currentPage = 0;
  final AudioPlayer _bgmPlayer = AudioPlayer();
  final AudioPlayer _voicePlayer = AudioPlayer();
  bool _isPlayingVoice = false;
  bool _isFlipping = false;

  @override
  void initState() {
    super.initState();
    _playBackgroundMusic();
  }

  Future<void> _playBackgroundMusic() async {
    await _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    await _bgmPlayer.play(AssetSource('music.mp3'));
  }

  Future<void> _playVoiceMessage() async {
    if (_isPlayingVoice) return;
    setState(() => _isPlayingVoice = true);
    await _bgmPlayer.stop();
    await _voicePlayer.play(AssetSource('voice.mp3'));
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      setState(() => _currentPage++);
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      setState(() => _currentPage--);
    }
  }

  @override
  void dispose() {
    _bgmPlayer.dispose();
    _voicePlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLastPage = _currentPage == _pages.length - 1;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [Colors.brown.shade200, Colors.brown.shade800],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onHorizontalDragStart: (_) => setState(() => _isFlipping = true),
                  onHorizontalDragEnd: (_) => setState(() => _isFlipping = false),
                  child: FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: _buildPageContent(_pages[_currentPage]),
                    back: _currentPage < _pages.length - 1
                        ? _buildPageContent(_pages[_currentPage + 1])
                        : _buildPageContent(
                            "✨ Magic Reveal ✨"),
                    onFlipDone: (isFront) {
                      if (!isFront) _nextPage();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (isLastPage)
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "To my always and Forever love...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'GaramondBook',
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      onPressed: _playVoiceMessage,
                      child: const Text("✨ Magic ✨"),
                    ),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (_currentPage > 0)
                      ElevatedButton(
                        onPressed: _prevPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[700],
                        ),
                        child: const Text("← Back"),
                      ),
                    ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: const Text("Next →"),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageContent(String text) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.brown.shade100.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 12,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Stack(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 22,
              fontFamily: 'GaramondBook',
              height: 1.5,
              color: Colors.black87,
            ),
          ),
          // 🌟 Sparkle overlay only while flipping
          if (_isFlipping)
            Positioned.fill(
              child: IgnorePointer(
                child: SpinKitRipple(
                  color: Colors.yellowAccent.withOpacity(0.25),
                  size: 300,
                  duration: const Duration(seconds: 4),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
