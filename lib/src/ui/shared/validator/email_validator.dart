// Copyright (c) 2023 Shudipto Trafder
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

class EmailValidator {
  static bool isValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
