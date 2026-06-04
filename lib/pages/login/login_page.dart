import 'package:flutter/material.dart';

import '../../core/helpers/auth_storage.dart';
import '../../core/network/api_service.dart';
import '../../core/widgets/app_card.dart';
import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ApiService _apiService = ApiService();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _codeFocusNode = FocusNode();
  final FocusNode _accountFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _agree = false;
  bool _isRequestingCode = false;
  bool _isLoggingIn = false;
  bool _useAccountLogin = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    _accountController.dispose();
    _passwordController.dispose();
    _phoneFocusNode.dispose();
    _codeFocusNode.dispose();
    _accountFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  bool get _canSubmit {
    if (_useAccountLogin) {
      return _accountController.text.trim().isNotEmpty && _passwordController.text.isNotEmpty && _agree;
    }
    return _phoneController.text.trim().isNotEmpty && _codeController.text.trim().isNotEmpty && _agree;
  }

  Future<void> _handleRequestCode() async {
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) {
      _showMessage('请输入手机号');
      _phoneFocusNode.requestFocus();
      return;
    }

    setState(() => _isRequestingCode = true);
    try {
      final result = await _apiService.sendTelephoneCode(
        phoneCountryCode: '+86',
        telephone: phone,
        ticket: '',
        randStr: '',
      );

      if (!mounted) return;
      _showMessage(result['message']?.toString() ?? '验证码已发送，请注意查收');
    } catch (error) {
      if (!mounted) return;
      _showMessage('发送验证码失败，请稍后重试');
    } finally {
      if (!mounted) return;
      setState(() => _isRequestingCode = false);
    }
  }

  Future<void> _handleLogin() async {
    if (!_agree) {
      _showMessage('请先阅读并同意用户协议和隐私政策');
      return;
    }

    if (_useAccountLogin) {
      _showMessage('当前仅实现手机号验证码登录');
      return;
    }

    if (_phoneController.text.trim().isEmpty) {
      _showMessage('请输入手机号');
      _phoneFocusNode.requestFocus();
      return;
    }
    if (_codeController.text.trim().isEmpty) {
      _showMessage('请输入验证码');
      _codeFocusNode.requestFocus();
      return;
    }

    setState(() => _isLoggingIn = true);
    try {
      final result = await _apiService.loginByCode(
        phoneCountryCode: '+86',
        telephone: _phoneController.text.trim(),
        code: _codeController.text.trim(),
      );

      final token = _extractToken(result);
      if (token != null && token.isNotEmpty) {
        await AuthStorage.saveToken(token);
      }

      final userInfo = _extractUserInfo(result);
      if (userInfo != null) {
        await AuthStorage.saveUserInfo(userInfo);
      }

      if (!mounted) return;
      _showMessage(result['message']?.toString() ?? '登录成功');

      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const HomePage()),
            (route) => false,
      );
    } catch (error) {
      if (!mounted) return;
      _showMessage('登录失败，请检查验证码后重试');
    } finally {
      if (!mounted) return;
      setState(() => _isLoggingIn = false);
    }
  }

  String? _extractToken(Map<String, dynamic> result) {
    final candidates = [
      result['token'],
      result['data'] is Map<String, dynamic> ? (result['data'] as Map<String, dynamic>)['token'] : null,
      result['data'] is Map<String, dynamic> ? (result['data'] as Map<String, dynamic>)['accessToken'] : null,
      result['data'] is String ? result['data'] : null,
    ];

    for (final candidate in candidates) {
      final value = candidate?.toString();
      if (value != null && value.isNotEmpty) {
        return value;
      }
    }
    return null;
  }

  Map<String, dynamic>? _extractUserInfo(Map<String, dynamic> result) {
    final data = result['data'];
    if (data is Map<String, dynamic>) {
      final userInfo = data['userInfo'];
      if (userInfo is Map<String, dynamic>) {
        return userInfo;
      }
      return data;
    }

    final userInfo = result['userInfo'];
    if (userInfo is Map<String, dynamic>) {
      return userInfo;
    }

    return null;
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primary.withValues(alpha: 0.08),
              colorScheme.surface,
              colorScheme.surface,
            ],
            stops: const [0, 0.22, 1],
          ),
        ),
        child: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom - 36,
                ),
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      Positioned(
                        top: -42,
                        right: -28,
                        child: _GlowBlob(color: const Color(0xFF7E68FF).withValues(alpha: 0.18), size: 150),
                      ),
                      Positioned(
                        top: 110,
                        left: -48,
                        child: _GlowBlob(color: const Color(0xFF4DB6FF).withValues(alpha: 0.16), size: 120),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              _RoundIconButton(
                                icon: Icons.arrow_back_ios_new_rounded,
                                onTap: () => Navigator.maybePop(context),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () => _showMessage('请联系客服或使用备用登录方式'),
                                style: TextButton.styleFrom(
                                  foregroundColor: colorScheme.onSurfaceVariant,
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                ),
                                child: const Text('登录遇到问题？'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  width: 72,
                                  height: 72,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xFF4DB6FF).withValues(alpha: 0.98),
                                        const Color(0xFF7E68FF).withValues(alpha: 0.98),
                                      ],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF7E68FF).withValues(alpha: 0.18),
                                        blurRadius: 24,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(Icons.lock_rounded, color: Colors.white, size: 34),
                                ),
                                const SizedBox(height: 18),
                                Text(
                                  'HI~ 欢迎登录',
                                  style: theme.textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.2,
                                    height: 1.05,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '请使用手机号验证码或账号密码登录',
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    height: 1.35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          _LoginModeSwitch(
                            isAccountLogin: _useAccountLogin,
                            onChanged: (value) => setState(() => _useAccountLogin = value),
                          ),
                          const SizedBox(height: 16),
                          AppCard(
                            padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 220),
                              switchInCurve: Curves.easeOut,
                              switchOutCurve: Curves.easeIn,
                              child: _useAccountLogin
                                  ? _buildAccountLogin(theme, colorScheme)
                                  : _buildCodeLogin(theme, colorScheme),
                            ),
                          ),
                          const SizedBox(height: 14),
                          _AgreementRow(
                            agree: _agree,
                            onTap: () => setState(() => _agree = !_agree),
                          ),
                          const SizedBox(height: 18),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: _canSubmit
                                      ? const [Color(0xFF4DB6FF), Color(0xFF7E68FF), Color(0xFFF042C5)]
                                      : [
                                    colorScheme.outlineVariant.withValues(alpha: 0.85),
                                    colorScheme.outlineVariant.withValues(alpha: 0.55),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(28),
                                boxShadow: _canSubmit
                                    ? [
                                  BoxShadow(
                                    color: const Color(0xFF7E68FF).withValues(alpha: 0.20),
                                    blurRadius: 18,
                                    offset: const Offset(0, 9),
                                  ),
                                ]
                                    : const [],
                              ),
                              child: ElevatedButton(
                                onPressed: _isLoggingIn ? null : (_canSubmit ? _handleLogin : null),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  disabledBackgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                                ),
                                child: _isLoggingIn
                                    ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.2,
                                    valueColor: AlwaysStoppedAnimation(Colors.white),
                                  ),
                                )
                                    : Text(
                                  '登录',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () => setState(() => _useAccountLogin = !_useAccountLogin),
                              style: TextButton.styleFrom(
                                foregroundColor: colorScheme.onSurface,
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              ),
                              child: Text(
                                _useAccountLogin ? '切换到手机号验证码登录' : '账号登录',
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                Text(
                                  '其他登录方式',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.outline,
                                  ),
                                ),
                                const SizedBox(height: 14),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _SocialLoginButton(
                                      icon: Icons.person_rounded,
                                      label: '游客',
                                      onTap: () => _showMessage('游客登录'),
                                    ),
                                    const SizedBox(width: 18),
                                    _SocialLoginButton(
                                      icon: Icons.chat_bubble_rounded,
                                      label: '微信',
                                      onTap: () => _showMessage('微信登录'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCodeLogin(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      key: const ValueKey('code-login'),
      children: [
        _InputRow(
          prefix: _CountryCodePicker(
            code: '+86',
            onTap: () => _showMessage('国家/地区选择待接入'),
          ),
          controller: _phoneController,
          hintText: '请输入手机号',
          keyboardType: TextInputType.phone,
          focusNode: _phoneFocusNode,
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 12),
        _InputRow(
          prefix: Icon(Icons.verified_user_outlined, size: 20, color: colorScheme.outline),
          controller: _codeController,
          hintText: '请输入验证码',
          keyboardType: TextInputType.number,
          focusNode: _codeFocusNode,
          onChanged: (_) => setState(() {}),
          suffix: TextButton(
            onPressed: _isRequestingCode ? null : _handleRequestCode,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 36),
              visualDensity: VisualDensity.compact,
              foregroundColor: colorScheme.primary,
            ),
            child: _isRequestingCode
                ? SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: colorScheme.primary,
              ),
            )
                : Text(
              '获取验证码',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAccountLogin(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      key: const ValueKey('account-login'),
      children: [
        _InputRow(
          prefix: Icon(Icons.person_outline_rounded, size: 20, color: colorScheme.outline),
          controller: _accountController,
          hintText: '请输入账号',
          keyboardType: TextInputType.text,
          focusNode: _accountFocusNode,
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 12),
        _InputRow(
          prefix: Icon(Icons.lock_outline_rounded, size: 20, color: colorScheme.outline),
          controller: _passwordController,
          hintText: '请输入密码',
          keyboardType: TextInputType.visiblePassword,
          focusNode: _passwordFocusNode,
          onChanged: (_) => setState(() {}),
          obscureText: true,
        ),
      ],
    );
  }
}

class _GlowBlob extends StatelessWidget {
  const _GlowBlob({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.surface.withValues(alpha: 0.92),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(icon, size: 18, color: colorScheme.onSurface),
        ),
      ),
    );
  }
}

class _LoginModeSwitch extends StatelessWidget {
  const _LoginModeSwitch({required this.isAccountLogin, required this.onChanged});

  final bool isAccountLogin;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.45)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ModeTab(
              title: '验证码登录',
              selected: !isAccountLogin,
              onTap: () => onChanged(false),
            ),
          ),
          Expanded(
            child: _ModeTab(
              title: '账号登录',
              selected: isAccountLogin,
              onTap: () => onChanged(true),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModeTab extends StatelessWidget {
  const _ModeTab({required this.title, required this.selected, required this.onTap});

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: selected ? colorScheme.surface : Colors.transparent,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: SizedBox(
          height: 42,
          child: Center(
            child: Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: selected ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AgreementRow extends StatelessWidget {
  const _AgreementRow({required this.agree, required this.onTap});

  final bool agree;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Icon(
                agree ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                size: 20,
                color: agree ? colorScheme.primary : colorScheme.outline,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                  children: [
                    const TextSpan(text: '我已阅读并同意 '),
                    TextSpan(
                      text: '《用户协议》',
                      style: TextStyle(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(text: ' 和 '),
                    TextSpan(
                      text: '《隐私政策》',
                      style: TextStyle(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InputRow extends StatelessWidget {
  const _InputRow({
    required this.prefix,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.keyboardType,
    this.focusNode,
    this.suffix,
    this.obscureText = false,
  });

  final Widget prefix;
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final Widget? suffix;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(27),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.9)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          IconTheme(data: IconThemeData(color: colorScheme.outline), child: prefix),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              keyboardType: keyboardType,
              obscureText: obscureText,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                isCollapsed: true,
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.outline,
                ),
              ),
            ),
          ),
          if (suffix != null) ...[
            Container(width: 1, height: 22, color: colorScheme.outlineVariant),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: suffix!,
            ),
          ],
        ],
      ),
    );
  }
}

class _CountryCodePicker extends StatelessWidget {
  const _CountryCodePicker({required this.code, required this.onTap});

  final String code;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              code,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(width: 2),
            Icon(Icons.keyboard_arrow_down_rounded, color: colorScheme.outline, size: 18),
          ],
        ),
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  const _SocialLoginButton({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Semantics(
      button: true,
      label: label,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colorScheme.outlineVariant),
            color: colorScheme.surface,
          ),
          child: Icon(icon, color: colorScheme.onSurface, size: 22),
        ),
      ),
    );
  }
}
