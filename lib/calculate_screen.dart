import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class CalculateCreditScreen1 extends StatefulWidget {
  const CalculateCreditScreen1({super.key});

  @override
  State<CalculateCreditScreen1> createState() => _CalculateCreditScreenState();
}

class _CalculateCreditScreenState extends State<CalculateCreditScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreditCalculatorForm(),
    );
  }
}

class CreditCalculatorForm extends StatefulWidget {
  @override
  _CreditCalculatorFormState createState() => _CreditCalculatorFormState();
}

class _CreditCalculatorFormState extends State<CreditCalculatorForm> {
  final _formKey = GlobalKey<FormState>();
  final _currencyFormatter =
      NumberFormat.currency(locale: 'ru_RU', symbol: 'KGS');

  double _creditAmount = 3000;
  double _term = 12;
  double _interestRate = 10;

  double _monthlyPayment = 0;
  double _totalInterest = 0;
  double _totalPayment = 0;

  void _calculate() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        double monthlyRate = _interestRate / 12 / 100;
        _monthlyPayment = _creditAmount *
            (monthlyRate / (1 - (1 / pow(1 + monthlyRate, _term))));
        _totalPayment = _monthlyPayment * _term;
        _totalInterest = _totalPayment - _creditAmount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Рассчитать кредит',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Сумма кредита'),
                  keyboardType: TextInputType.number,
                  initialValue: _creditAmount.toString(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите сумму кредита';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _creditAmount = double.tryParse(value) ?? 0;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Срок (месяц)',
                  style: TextStyle(fontSize: 18),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.red,
                    inactiveTrackColor: Colors.grey[300],
                    trackHeight: 4.0,
                    thumbColor: Colors.red,
                    overlayColor: Colors.red.withOpacity(0.2),
                    valueIndicatorColor: Colors.red,
                    valueIndicatorTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 20.0),
                  ),
                  child: Slider(
                    value: _term,
                    min: 3,
                    max: 18,
                    divisions: 15,
                    label: _term.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _term = value;
                      });
                    },
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('3'),
                    Text('6'),
                    Text('9'),
                    Text('12'),
                    Text('18'),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Процентная ставка'),
                  keyboardType: TextInputType.number,
                  initialValue: _interestRate.toString(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите процентную ставку';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _interestRate = double.tryParse(value) ?? 0;
                    });
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 400.w,
                  child: MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      _calculate();
                    },
                    child: Text(
                      "Рассчитать",
                      style: TextStyle(
                          fontFamily: "SanSerif",
                          fontSize: 12.sp,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Итого',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Divider(color: Colors.red),
                _buildSummaryRow(
                    'Сумма кредита', _currencyFormatter.format(_creditAmount)),
                _buildSummaryRow('Ежемесячные взносы',
                    _currencyFormatter.format(_monthlyPayment)),
                _buildSummaryRow('Сумма процентов за период',
                    _currencyFormatter.format(_totalInterest)),
                _buildSummaryRow('Общая сумма выплат',
                    _currencyFormatter.format(_totalPayment)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value),
        ],
      ),
    );
  }
}
