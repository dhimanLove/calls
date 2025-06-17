import 'package:flutter/material.dart';
import 'package:calls/pages/callpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _callIdController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void dispose() {
    _callIdController.dispose();
    _userIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Colors.blueAccent.shade700;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 6,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black26,
        leading: Icon(
          Icons.video_camera_front_outlined,
          color: primaryColor,
          size: 28,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Video Call',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Zego Cloud Demo',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: primaryColor),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Zego Cloud Video Call',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.video_call, size: 40, color: Colors.blueAccent),
                children: [
                  const Text(
                    'This app demonstrates how to use Zego Cloud for video calling.',
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'For more information, visit our website or contact support.',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              );
            },
            tooltip: 'Info',
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child:
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Join a Call',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Enter your details below to start a video call',
                      style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 32),

                    // 👤 User ID Input
                    TextField(
                      controller: _userIdController,
                      decoration: InputDecoration(
                        labelText: 'Your User ID',
                        prefixIcon: Icon(Icons.person_outline, color: primaryColor),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 📞 Call ID Input
                    TextField(
                      controller: _callIdController,
                      decoration: InputDecoration(
                        labelText: 'Call ID',
                        prefixIcon: Icon(
                          Icons.videocam_outlined,
                          color: primaryColor,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // ✅ Join Call Button
                    ElevatedButton.icon(
                      onPressed: () {
                        final userId = _userIdController.text.trim();
                        final callId = _callIdController.text.trim();

                        if (userId.isEmpty || callId.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Please enter both User ID and Call ID",
                              ),
                            ),
                          );
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                Callpage(userId: userId, callId: callId),
                          ),
                        );
                      },
                      icon: const Icon(Icons.call),
                      label: const Text(
                        'Join Call',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 4,
                        minimumSize: const Size.fromHeight(50),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
