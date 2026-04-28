import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isMerchant = false;
  final _storeNameController = TextEditingController();
  final _handleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إنشاء حساب جديد'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'الاسم الكامل',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'رقم الهاتف',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'كلمة المرور',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('تسجيل كتاجر؟'),
              subtitle: const Text('اختر هذا لتتمكن من نشر منتجاتك'),
              value: _isMerchant,
              onChanged: (value) {
                setState(() {
                  _isMerchant = value;
                });
              },
            ),
            if (_isMerchant) ...[
              const SizedBox(height: 16),
              TextField(
                controller: _storeNameController,
                decoration: const InputDecoration(
                  labelText: 'اسم المتجر',
                  prefixIcon: Icon(Icons.store),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _handleController,
                decoration: const InputDecoration(
                  labelText: 'المعرف الفريد (مثل: @DjinanTech)',
                  prefixIcon: Icon(Icons.alternate_email),
                ),
              ),
            ],
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // For MVP, just navigate to home directly
                context.go('/');
              },
              child: const Text('إنشاء حساب'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('لديك حساب بالفعل؟ سجل دخولك'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _storeNameController.dispose();
    _handleController.dispose();
    super.dispose();
  }
}
