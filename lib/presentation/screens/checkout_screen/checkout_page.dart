import 'package:book_your_flight/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/flight.dart';
import '../../../data/models/passenger.dart';
import '../../../logic/cubit/book_cubit/book_cubit.dart';
import '../auth/widgets/auth_button.dart';

class CheckoutPage extends StatefulWidget {
  final Flight flight;
  final String seatClass;
  final List<Passenger> passengers;
  const CheckoutPage({
    Key? key,
    required this.flight,
    required this.seatClass,
    required this.passengers,
  }) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  Flight get flight => widget.flight;
  String get seatClass => widget.seatClass;
  List<Passenger> get passengers => widget.passengers;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  book() {
    BlocProvider.of<BookCubit>(context)
        .book(flight: flight, seatClass: seatClass, passengers: passengers);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: AppColors.lightColor,
                    size: 20.sp,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Checkout",
                  style: TextStyle(
                      color: AppColors.lightColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: Container(
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  color: AppColors.lightColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(5.w)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.darkElv0.withOpacity(
                        0.2,
                      ),
                      offset: Offset(
                        0,
                        -1.h,
                      ),
                      blurRadius: 1.h,
                    ),
                  ],
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    CreditCardWidget(
                      cardBgColor: Colors.redAccent[200]!,
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      showBackView: isCvvFocused,
                      obscureCardNumber: false,
                      obscureCardCvv: false,
                      onCreditCardWidgetChange: (CreditCardBrand) {},
                    ),
                    CreditCardForm(
                      formKey: formKey,
                      onCreditCardModelChange: onCreditCardModelChange,
                      obscureCvv: true,
                      obscureNumber: false,
                      cardNumberDecoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        errorStyle: TextStyle(
                          color: AppColors.lightColor.withOpacity(
                            0.5,
                          ),
                        ),
                      ),
                      expiryDateDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder Name',
                      ),
                      cardHolderName: '',
                      cardNumber: '',
                      cvvCode: '',
                      expiryDate: '',
                      themeColor: AppColors.lightColor,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Center(
                        child: BlocConsumer<BookCubit, BookState>(
                      listener: (context, state) {
                        if (state is BookFailed) {
                          SnackBar snackBar = SnackBar(
                              content: Text(state.errorMsg.toString()));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        if (state is BookSucceed) {
                          Navigator.pushNamed(context, AppRouter.mapPage);
                        }
                      },
                      builder: (context, state) {
                        if (state is BookLoading) {
                          return const CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          );
                        }
                        return AuthButton(text: "Pay", onPress: () => book());
                      },
                    )),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class CreditCardInputs extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expireDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  CreditCardInputs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: AppColors.lightColor,
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Name",
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: cardNumberController,
            decoration: const InputDecoration(
              labelText: "Expiry Date",
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  controller: expireDateController,
                  decoration: const InputDecoration(
                    labelText: "Card Number",
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: cvvController,
                  decoration: const InputDecoration(
                    labelText: "CVV",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
