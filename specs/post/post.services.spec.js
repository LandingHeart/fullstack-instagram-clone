// sample test
const mathOperations = require("../../services/testServices");

describe("Calculator Tests", () => {
  test("Division of 2 numbers", () => {
    // arrange and act
    var result = mathOperations.divide(24, 8);

    // assert
    expect(result).toBe(3);
  });
});
