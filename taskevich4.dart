import 'package:flutter/material.dart';

void main() {
  runApp(const BusinessApp());
}

class BusinessApp extends StatelessWidget {
  const BusinessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileCardScreen(),
    );
  }
}

class ProfileCardScreen extends StatefulWidget {
  const ProfileCardScreen({super.key});

  @override
  State<ProfileCardScreen> createState() => _ProfileCardScreenState();
}

class _ProfileCardScreenState extends State<ProfileCardScreen> {
  bool _isFollowing = false;
  bool _isLiked = false;

  int _followerCount = 1320;
  int _likesCount = 120;

  // Переключение Follow / Following
  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;

      if (_isFollowing) {
        _followerCount++;
      } else {
        _followerCount--;
      }
    });
  }

  // Переключение Like / Liked
  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;

      if (_isLiked) {
        _likesCount++;
      } else {
        _likesCount--;
      }
    });
  }

  // Сброс всех значений
  void _reset() {
    setState(() {
      _isFollowing = false;
      _isLiked = false;
      _followerCount = 1320;
      _likesCount = 120;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль разработчика'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Center(
        child: Card(
          elevation: 6,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(24.0),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // Аватар
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.lime,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 16),

                // Имя
                const Text(
                  'BeKZat Zharylkassyn',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                // Должность
                const Text(
                  'Senior Lecturer',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 24),

                // Подписчики и лайки
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Column(
                      children: [
                        Text(
                          '$_followerCount',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Подписчики',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Text(
                          '$_likesCount',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Лайки',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Кнопки Follow и Like
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ElevatedButton.icon(
                      onPressed: _toggleFollow,

                      icon: Icon(
                        _isFollowing
                            ? Icons.check
                            : Icons.person_add,
                      ),

                      label: Text(
                        _isFollowing
                            ? 'Following'
                            : 'Follow',
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 12),

                    OutlinedButton.icon(
                      onPressed: _toggleLike,

                      icon: Icon(
                        _isLiked
                            ? Icons.favorite
                            : Icons.favorite_border,

                        color: _isLiked
                            ? Colors.red
                            : null,
                      ),

                      label: Text(
                        _isLiked
                            ? 'Liked'
                            : 'Like',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Кнопка Reset
                TextButton.icon(
                  onPressed: _reset,

                  icon: const Icon(Icons.refresh),

                  label: const Text('Reset'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
