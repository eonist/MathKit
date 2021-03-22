import Foundation

class Algebra{
	/**
	 * Returns a fraction in a quadratic equation
	 * PARAM: a x^2
	 * PARAM: b x
	 * PARAM: c the number
	 * EXAMPLE: Algebra.quadratic(0.5, 6, -68))//7.114877048604001
	 */
	static func quadratic(_ a: CGFloat, _ b: CGFloat, _ c: CGFloat) -> CGFloat {
		let numerator: CGFloat = -b + sqrt(b * b - 4 * a * c)
		let denominator: CGFloat = 2 * a
		return numerator / denominator // fraction
	}
	/**
    * Find exponent when you have base and result
    * - Parameters:
    *   - base: 2^3 = 8 (2 is the base)
    *   - value: 2^3 = 8 (8 is the value or the result if you like)
    * ## Examples:
    * print(exponent(base: 2, result: 4)) // 2
    * print(exponent(base: 2, result: 8)) // 3
    * print(exponent(base: 2, result: 16)) // 4
    * print(exponent(base: 2, result: 128)) // 7
    * print(exponent(base: 2, result: 256)) // 8
    */
   static func exponent(base: CGFloat, value: CGFloat) -> CGFloat {
      log(value) / log(base) // var i: Int = 1; while pow(base, CGFloat(i)) < value { i += 1 }; return i
   }
}
