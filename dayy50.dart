enum ATMState {
  idle,
  cardInserted,
  authenticated,
  dispensing
}

class ATM {
  ATMState _state = ATMState.idle;
  double _balance = 1000;

  void insertCard() {
    if (_state == ATMState.idle) {
      _state = ATMState.cardInserted;
      print("Card inserted");
    }
  }

  void enterPin(int pin) {
    if (_state == ATMState.cardInserted && pin == 1234) {
      _state = ATMState.authenticated;
      print("Authenticated");
    }
  }

  void withdraw(double amount) {
    if (_state == ATMState.authenticated && amount <= _balance) {
      _state = ATMState.dispensing;
      _balance -= amount;
      print("Dispensing $amount");
      _state = ATMState.idle;
    }
  }

  void checkState() {
    print("Current state: $_state");
  }
}

void main() {
  ATM atm = ATM();

  atm.checkState();
  atm.insertCard();
  atm.enterPin(1234);
  atm.withdraw(200);
  atm.checkState();
}