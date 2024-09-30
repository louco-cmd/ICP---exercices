import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Text "mo:base/Text";
import Float "mo:base/Float";

actor BBank {
  stable var currentValue: Float = 300;
  currentValue := 300;
  let id = 1234;

  // Initialize startTime
  stable var startTime = Time.now();
 // startTime := Time.now();

  // Initialize prints in an initialization block
  func init() {
    Debug.print(debug_show(startTime));
    Debug.print(debug_show(id));
  };

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("not enough money on your account.");
    }
  };

  public query func checkBalance() : async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeLapse = currentTime - startTime;
    let timeElapse = timeLapse / 1000000000;
    currentValue := currentValue * (1.001 ** Float.fromInt(timeElapse));
    startTime := currentTime;
  };
}
